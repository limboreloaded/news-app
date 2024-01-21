import 'dart:async';
import 'package:bt_app/controllers/user_controller.dart';
import 'package:bt_app/main.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:bt_app/pages/latest_news.dart';
import 'package:bt_app/pages/latest_projects.dart';
import 'package:bt_app/pages/latest_tweets.dart';
import 'package:bt_app/controllers/tweets_controller.dart';
import 'package:bt_app/controllers/news_controller.dart';
import 'package:bt_app/controllers/dapp_controller.dart';
import 'package:bt_app/controllers/radar_controller.dart';
import 'package:bt_app/controllers/events_controller.dart';
import 'package:bt_app/controllers/prices_controller.dart';

class Latest extends HookConsumerWidget {
  final int initialPage;
  final List<String> pageTitles = const ['News', 'Tweets', 'Projects'];

  const Latest({super.key, required this.initialPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<String> currentPageTitle =
        useState(pageTitles[initialPage]);
    PageController pageController = usePageController(initialPage: initialPage);
    ScrollController headerScrollController =
        useScrollController(keepScrollOffset: false);
    Function onTabChange =
        useCallback((int index, PageController pageController) {
      if (pageController.hasClients) {
        pageController.jumpToPage(index);
      }
      currentPageTitle.value = pageTitles[index];

      dynamic positionMap = {
        0: headerScrollController.position.minScrollExtent,
        1: headerScrollController.position.maxScrollExtent / 2,
        2: headerScrollController.position.maxScrollExtent
      };

      if (headerScrollController.hasClients) {
        Future.delayed(const Duration(milliseconds: 50), () {
          headerScrollController.animateTo(positionMap[index],
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutBack);
        });
      }
    }, []);

    return CustomRefreshIndicator(
      builder: MaterialIndicatorDelegate(
        edgeOffset: 210,
        displacement: 0,
        builder: (context, controller) {
          return const Icon(
            Icons.ac_unit,
            color: Colors.blue,
            size: 30,
          );
        },
      ),
      notificationPredicate: (notification) {
        return notification.metrics.axis == Axis.vertical &&
            notification.depth == 2;
      },
      autoRebuild: true,
      onRefresh: () async {
        if (currentPageTitle.value == "News") {
          bool canRefreshPrices =
              await ref.read(pricesProvider.notifier).canRefreshPrices();

          if (canRefreshPrices) {
            ref.invalidate(pricesProvider);
          }

          return await ref.read(newsProvider.notifier).refreshNews(true);
        } else if (currentPageTitle.value == "Tweets") {
          return await ref.read(tweetsProvider.notifier).refreshTweets(true);
        } else {
          await ref.read(dappProvider.notifier).refreshDapps(true);
          await ref.read(eventsProvider.notifier).refreshEvents(true);
          await ref.read(radarsProvider.notifier).refreshRadars(true);
        }
      },
      child: NestedScrollView(
          controller: PageWrapper.of(context)?.bottomBarController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  floating: true,
                  snap: false,
                  pinned: true,
                  expandedHeight: 103,
                  surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                    double top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                        titlePadding: top < 85
                            ? const EdgeInsets.only(
                                left: 20, bottom: 16, right: 14)
                            : EdgeInsets.zero,
                        centerTitle: top < 85 ? true : false,
                        title: top < 85
                            ? Text(
                                currentPageTitle.value,
                                overflow: TextOverflow.visible,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.apply(fontWeightDelta: 4),
                              )
                            : LatestExpandedHeader(
                                headerScrollController: headerScrollController,
                                currentPageTitle: currentPageTitle,
                                pageController: pageController,
                                pageTitles: pageTitles,
                                onTabChange: onTabChange));
                  }),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            ];
          },
          body: PageView(
              onPageChanged: (index) => onTabChange(index, pageController),
              controller: pageController,
              children: const [
                NewsPage(),
                TweetsPage(),
                ProjectsPage(),
              ])),
    );
  }
}

class LatestExpandedHeader extends StatefulHookConsumerWidget {
  final ScrollController headerScrollController;
  final ValueNotifier<String> currentPageTitle;
  final PageController pageController;
  final List<String> pageTitles;
  final Function onTabChange;

  const LatestExpandedHeader(
      {super.key,
      required this.headerScrollController,
      required this.currentPageTitle,
      required this.pageController,
      required this.pageTitles,
      required this.onTabChange});

  @override
  LatestExpandedHeaderState createState() => LatestExpandedHeaderState();
}

class LatestExpandedHeaderState extends ConsumerState<LatestExpandedHeader>
    with SingleTickerProviderStateMixin {
  LatestExpandedHeaderState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final userController = ref.watch(userProvider);

    return SizedBox(
        width: width,
        child: Stack(clipBehavior: Clip.none, children: [
          SizedBox(
              width: width * 0.6,
              child: SingleChildScrollView(
                  controller: widget.headerScrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () =>
                                widget.onTabChange(0, widget.pageController),
                            child: Text(
                              widget.pageTitles[0],
                              style: widget.pageTitles[0] ==
                                      widget.currentPageTitle.value
                                  ? Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.apply(fontWeightDelta: 4)
                                  : Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.apply(fontWeightDelta: 1),
                            ))),
                    const SizedBox(width: 10),
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () =>
                            widget.onTabChange(1, widget.pageController),
                        child: Text(
                          widget.pageTitles[1],
                          style: widget.pageTitles[1] ==
                                  widget.currentPageTitle.value
                              ? Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.apply(fontWeightDelta: 4)
                              : Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.apply(fontWeightDelta: 1),
                        )),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () =>
                              widget.onTabChange(2, widget.pageController),
                          child: Text(
                            widget.pageTitles[2],
                            style: widget.pageTitles[2] ==
                                    widget.currentPageTitle.value
                                ? Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.apply(fontWeightDelta: 4)
                                : Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.apply(fontWeightDelta: 1),
                          )),
                    ),
                    const SizedBox(width: 24),
                  ]))),
          Positioned(
              right: 0,
              child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: CircleAvatar(
                    backgroundImage:
                        ref.read(userProvider.notifier).isAuthenticated()
                            ? CachedNetworkImageProvider(
                                userController.value!.avatarUrl)
                            : null,
                    backgroundColor: const Color.fromARGB(255, 39, 7, 153),
                    radius: 21,
                  )))
        ]));
  }
}
