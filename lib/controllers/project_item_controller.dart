import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectState {
  final List<NewsModel> news;
  final ArticlesModel project;

  ProjectState({required this.news, required this.project});

  ProjectState copyWith({List<NewsModel>? news, ArticlesModel? project}) {
    return ProjectState(
        news: news ?? this.news, project: project ?? this.project);
  }
}

class AsyncNewsItemNotifier extends FamilyAsyncNotifier<ProjectState, String> {
  @override
  Future<ProjectState> build(String arg) async {
    final projectEntry = await _fetchProjectEntry(arg);
    final newsForProject = await _fetchNewsForProject(arg);

    return ProjectState(news: newsForProject, project: projectEntry);
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

final projectsItemFamily =
    AsyncNotifierProviderFamily<AsyncNewsItemNotifier, ProjectState, String>(
        () {
  return AsyncNewsItemNotifier();
});
