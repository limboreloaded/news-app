import 'package:bt_app/components/shared/tab_bar.dart';
import 'package:bt_app/controllers/actions_controller.dart';
import 'package:bt_app/controllers/dapp_controller.dart';
import 'package:bt_app/controllers/last_updated_controller.dart';
import 'package:bt_app/controllers/news_controller.dart';
import 'package:bt_app/controllers/prices_controller.dart';
import 'package:bt_app/controllers/radar_controller.dart';
import 'package:bt_app/controllers/events_controller.dart';
import 'package:bt_app/controllers/tweets_controller.dart';
import 'package:bt_app/controllers/articles_controller.dart';
import 'package:bt_app/controllers/nft_controller.dart';
import 'package:bt_app/controllers/chain_controller.dart';
import 'package:bt_app/data/models.dart';
import 'package:bt_app/pages/user.dart';
import 'package:bt_app/utils/database.dart';
import 'package:bt_app/pages/actions.dart';
import 'package:bt_app/pages/home.dart';
import 'package:bt_app/pages/latest.dart';
import 'package:bt_app/pages/settings.dart';
import 'package:bt_app/utils/dio.dart';
import 'package:bt_app/utils/prefs.dart';
import 'package:bt_app/controllers/various_controllers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion/motion.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:network_logger/network_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:scheduled_timer/scheduled_timer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(60.fps);

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class PageWrapper extends StatefulWidget {
  final Widget child;
  final ScrollController bottomBarController;

  const PageWrapper({
    super.key,
    required this.child,
    required this.bottomBarController,
  });

  @override
  PageWrapperState createState() => PageWrapperState();

  static PageWrapperState? of(BuildContext context) =>
      context.findAncestorStateOfType<PageWrapperState>();
}

class PageWrapperState extends State<PageWrapper>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    NetworkLoggerOverlay.attachTo(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.bottomBarController.dispose();
  }

  get bottomBarController {
    return widget.bottomBarController;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp>
    with SingleTickerProviderStateMixin {
  MyAppState();

  bool isLoading = true;

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return NoTransitionPage(
                child: Scaffold(
                    backgroundColor: const Color.fromRGBO(27, 5, 54, 1),
                    body: SafeArea(
                        bottom: false,
                        child: BottomBar(
                            fit: StackFit.expand,
                            icon: (width, height) {
                              return const Icon(
                                Icons.arrow_upward_rounded,
                                color: Colors.white,
                              );
                            },
                            borderRadius: BorderRadius.circular(500),
                            duration: const Duration(seconds: 1),
                            curve: Curves.decelerate,
                            barColor: Theme.of(context).primaryColor,
                            showIcon: true,
                            start: 2,
                            end: 0,
                            bottom: 10,
                            alignment: Alignment.bottomCenter,
                            iconHeight: 35,
                            iconWidth: 35,
                            reverse: false,
                            hideOnScroll: true,
                            scrollOpposite: false,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CustomTabBar(
                                changePage: () {},
                              ),
                            ),
                            body: (context, controller) {
                              return PageWrapper(
                                  bottomBarController: controller,
                                  child: child);
                            }))));
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: HomePage());
              },
            ),
            GoRoute(
              path: '/user',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: UserPage());
              },
            ),
            GoRoute(
              path: '/latest/news',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                    child: Latest(
                  initialPage: 0,
                ));
              },
            ),
            GoRoute(
              path: '/latest/tweets',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                    child: Latest(
                  initialPage: 1,
                ));
              },
            ),
            GoRoute(
              path: '/latest/projects',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                    child: Latest(
                  initialPage: 2,
                ));
              },
            ),
            GoRoute(
              path: '/actions',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ActionsPage());
              },
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: SettingsPage());
              },
            ),
          ]),
    ],
  );

  @override
  void initState() {
    super.initState();
    initDatabase();
    triggerTimer();
  }

  Future populateDatabase() async {
    await ref.read(newsProvider.notifier).populateNews();
    await ref.read(actionsProvider.notifier).populateActions();
    await ref.read(eventsProvider.notifier).populateEvents();
    await ref.read(tweetsProvider.notifier).populateTweets();
    await ref.read(articlesProvider.notifier).populateArticles();
    await ref.read(cronProvider.notifier).populateCron();
    await ref.read(radarsProvider.notifier).populateRadars();
    await ref.read(pricesProvider.notifier).populatePrices();
    await ref.read(chainsProvider.notifier).populateChains();
    await ref.read(dappProvider.notifier).populateDapps();
    await ref.read(nftsProvider.notifier).populateNfts();
  }

  Future refresh() async {
    final Dio dio = ref.read(dioProvider);

    Map<String, dynamic> tableToRefresh = {
      "Action": () => ref.read(actionsProvider.notifier).refreshActions(false),
      "Event": () => ref.read(eventsProvider.notifier).refreshEvents(false),
      "News": () => ref.read(newsProvider.notifier).refreshNews(false),
      "Radar": () => ref.read(radarsProvider.notifier).refreshRadars(false),
      "Tweet": () => ref.read(tweetsProvider.notifier).refreshTweets(false),
      "Nft": () => ref.read(nftsProvider.notifier).refreshNfts(false),
    };

    Map<String, DateTime> localTablesToUpdates = {};

    Response<dynamic> fetchedUpdates =
        await dio.get("https://data.blocktalk.tv/last_updated");
    List<CronModel> localUpdates =
        await ref.read(cronProvider.notifier).getCronItems();

    //! CRON TABLES ALREADY HAVE GETTERS (update.name)

    for (CronModel update in localUpdates) {
      String tableName = update.tableName;
      localTablesToUpdates[tableName] = DateTime.parse(update.lastUpdated);
    }

    for (dynamic update in fetchedUpdates.data) {
      String updateName = update["name"];

      if (localTablesToUpdates[updateName] == null) return;

      DateTime lastUpdated =
          DateTime.parse(localTablesToUpdates[updateName].toString());

      DateTime fetchedLastUpdate = DateTime.fromMillisecondsSinceEpoch(
          int.parse(update["last_updated"].toString()));

      if (!lastUpdated.isBefore(fetchedLastUpdate) &&
          tableToRefresh[updateName] != null) {
        await tableToRefresh[updateName]();
      }
    }
  }

  void triggerTimer() async {
    SharedPrefs sharedPrefs = ref.read(sharedPrefsProvider);
    bool isFirstLaunch = sharedPrefs.isFirstLaunch();

    late ScheduledTimer initTimer;
    initTimer = ScheduledTimer(
        id: "refresh",
        onExecute: () async {
          bool isResetting = ref.read(resetProvider.notifier).getResetValue();

          if (isResetting) return;

          await refresh();
          initTimer.schedule(DateTime.now().add(const Duration(minutes: 5)));
        },
        onMissedSchedule: () => initTimer.execute(),
        defaultScheduledTime: DateTime.now().add(isFirstLaunch
            ? const Duration(minutes: 5)
            : const Duration(seconds: 0)));
    initTimer.execute();
  }

  void initDatabase() async {
    SharedPrefs sharedPrefs = ref.read(sharedPrefsProvider);

    bool isFirstLaunch = sharedPrefs.isFirstLaunch();

    if (isFirstLaunch) {
      await ref.read(AppDatabase.provider).clear();
      await populateDatabase();
      await sharedPrefs.setFirstLaunch(false);
    } else {
      await ref.read(cronProvider.notifier).populateLastUpdated();
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(resetProvider, (previous, next) async {
      if (next == true) {
        setState(() {
          isLoading = true;
        });
        await ref.read(AppDatabase.provider).clear();
        await populateDatabase();
        setState(() {
          isLoading = false;
        });
        ref.read(resetProvider.notifier).resetDatabase(false);
      }
    });

    FlutterNativeSplash.remove();
    StatusBarControl.setHidden(true);

    if (isLoading) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blocktalk App',
        builder: (context, child) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        },
        theme: ThemeData(
          fontFamily: 'ClashGrotesk',
          brightness: Brightness.dark,
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromRGBO(27, 5, 54, 1),
        ),
      );
    }

    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Blocktalk App',
      theme: ThemeData(
        fontFamily: 'ClashGrotesk',
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromRGBO(27, 5, 54, 1),
      ),
    );
  }
}
