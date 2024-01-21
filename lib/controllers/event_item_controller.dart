import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventState {
  final List<NewsModel> news;
  final EventsModel event;
  final ArticlesModel associatedProject;

  EventState(
      {required this.news,
      required this.event,
      required this.associatedProject});

  EventState copyWith(
      {List<NewsModel>? news,
      EventsModel? event,
      ArticlesModel? associatedProject}) {
    return EventState(
        news: news ?? this.news,
        event: event ?? this.event,
        associatedProject: associatedProject ?? this.associatedProject);
  }
}

class AsyncNewsItemNotifier extends FamilyAsyncNotifier<EventState, String> {
  @override
  Future<EventState> build(String arg) async {
    final eventEntry = await _fetchEventEntry(arg);
    final newsForProject = await _fetchNewsForProject(arg);
    final projectEntry = await _fetchProjectEntry(eventEntry.id.toString());

    return EventState(
        news: newsForProject,
        event: eventEntry,
        associatedProject: projectEntry);
  }

  Future<EventsModel> _fetchEventEntry(String id) async {
    final db = ref.read(AppDatabase.provider);
    final eventEntry = await db.getEventsItem(arg);

    EventsModel savedEntry = EventsModel.fromTable(eventEntry);

    return savedEntry;
  }

  Future<ArticlesModel> _fetchProjectEntry(String id) async {
    final db = ref.read(AppDatabase.provider);
    final projectEntry = await db.getArticlesItem(arg);

    ArticlesModel savedEntry = ArticlesModel.fromTable(projectEntry);

    return savedEntry;
  }

  Future<List<NewsModel>> _fetchNewsForProject(String id) async {
    final db = ref.read(AppDatabase.provider);
    final fetchedNews = await db.getNewsByProjectId(id);

    List<NewsModel> savedEntries = [];
    for (dynamic newsEntry in fetchedNews) {
      NewsModel savedProject = NewsModel.fromTable(newsEntry);
      savedEntries.add(savedProject);
    }

    return savedEntries;
  }
}

final eventsItemFamily =
    AsyncNotifierProviderFamily<AsyncNewsItemNotifier, EventState, String>(() {
  return AsyncNewsItemNotifier();
});
