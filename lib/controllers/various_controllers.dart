import 'package:bt_app/data/models.dart';
import 'package:riverpod/riverpod.dart';
import 'package:bt_app/controllers/tweets_controller.dart';
import 'package:bt_app/controllers/events_controller.dart';
import 'package:bt_app/controllers/news_controller.dart';
import 'package:bt_app/controllers/actions_controller.dart';
import 'package:bt_app/controllers/dapp_controller.dart';
import 'package:bt_app/controllers/nft_controller.dart';
import 'package:bt_app/controllers/chain_controller.dart';

class Filter extends StateNotifier<String> {
  Filter() : super('');

  void setFilter(String filter) {
    if (state == filter) {
      state = '';
    } else {
      state = filter;
    }
  }
}

final filterProvider = StateNotifierProvider((ref) {
  return Filter();
});

class Reset extends StateNotifier<bool> {
  Reset() : super(false);

  void resetDatabase(bool value) {
    state = value;
  }

  bool getResetValue() {
    return state;
  }
}

final resetProvider = StateNotifierProvider((ref) {
  return Reset();
});

class Tab extends StateNotifier<String> {
  Tab() : super("0");

  void setCurrentTab(int index) {
    state = index.toString();
  }
}

final tabProvider = StateNotifierProvider((ref) {
  return Tab();
});

final routeCardsProvider = FutureProvider<List<StatsModel>>((ref) async {
  final tweetsCount =
      await ref.watch(tweetsProvider.selectAsync((data) => data.length));
  final eventsCount =
      await ref.watch(eventsProvider.selectAsync((data) => data.length));
  final newsCount =
      await ref.watch(newsProvider.selectAsync((data) => data.length));
  final actionsCount =
      await ref.watch(actionsProvider.selectAsync((data) => data.length));

  return [
    StatsModel(
      category: 'Twitter',
      number: tweetsCount,
      text: 'follows today',
      icon: 'assets/twitter_logo.png',
      route: '/latest/tweets',
    ),
    StatsModel(
        category: 'Whales',
        number: actionsCount,
        text: 'mints today',
        icon: 'assets/monopoly_icon.png',
        route: '/actions'),
    StatsModel(
        category: 'News',
        number: newsCount,
        text: 'articles today',
        icon: 'assets/newspaper_icon.png',
        route: '/latest/news'),
    StatsModel(
        category: 'Events',
        number: eventsCount,
        text: 'events this week',
        icon: 'assets/calendar_icon.png',
        route: '/latest/projects'),
  ];
});

final homeProjectsProvider = FutureProvider<List<dynamic>>((ref) async {
  final homeProjects = [];

  final homeDapps = await ref.read(dappProvider.notifier).getLastDapps();
  final homeChains = await ref.read(chainsProvider.notifier).getLastChains();
  final homeNfts = await ref.read(nftsProvider.notifier).getLastNfts();
  final homeEvents = await ref.read(eventsProvider.notifier).getLastEvents();

  for (ChainsModel chain in homeChains) {
    homeProjects.add(chain);
  }

  for (NftsModel nft in homeNfts) {
    homeNfts.add(nft);
  }

  for (DappsModel dapp in homeDapps) {
    homeProjects.add(dapp);
  }

  for (EventsModel event in homeEvents) {
    homeProjects.add(event);
  }

  return homeProjects;
});
