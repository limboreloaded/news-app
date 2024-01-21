import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final List<StatsModel> actions;
  final List events;

  HomeState({required this.actions, required this.events});

  HomeState copyWith({
    List<StatsModel>? actions,
    List? events,
  }) {
    return HomeState(
      actions: actions ?? this.actions,
      events: events ?? this.events,
    );
  }
}

class AsyncHomeNotifier extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    final fetchedActions = await _fetchActions();
    final fetchedEvents = await _fetchEvents();
    final newState = HomeState(
      actions: fetchedActions,
      events: fetchedEvents,
    );
    await Future.delayed(const Duration(seconds: 1));
    return newState;
  }

  Future<List<StatsModel>> _fetchActions() async {
    final db = ref.read(AppDatabase.provider);

    final tweetsCount = await db.tweetsCount().getSingle();
    final actionsCount = await db.actionsCount().getSingle();
    final newsCount = await db.newsCount().getSingle();
    final eventsCount = await db.eventsCount().getSingle();

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
  }

  Future<List> _fetchEvents() async {
    final db = ref.read(AppDatabase.provider);
    final lastEvents = await db.getLastEvents();
    final lastProjects = await db.getLastArticles();

    List savedEntries = [];
    for (dynamic project in lastProjects) {
      ArticlesModel savedProject = ArticlesModel.fromTable(project);
      savedEntries.add(savedProject);
    }

    for (dynamic event in lastEvents) {
      EventsModel savedEvent = EventsModel.fromTable(event);
      savedEntries.add(savedEvent);
    }

    return savedEntries;
  }
}

final homeProvider = AsyncNotifierProvider<AsyncHomeNotifier, HomeState>(() {
  return AsyncHomeNotifier();
});





// class AsyncNoStateNotifier extends AsyncNotifier<List> {
//   @override
//   Future<List> build() async {
//     final fetchedActions = await _fetchActions();

//     final newState = fetchedActions;
//   }

//   Future<List> _fetchActions() async {
//     return [];
//   }
// }
