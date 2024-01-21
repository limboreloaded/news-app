// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:bt_app/data/models.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:bt_app/data/tables.dart';
import 'dart:math';
import 'package:drift_dev/api/migrations.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    NewsTable,
    ArticlesTable,
    EventsTable,
    ActionsTable,
    TweetsTable,
    CronTable,
    RadarsTable,
    PricesTable,
    UsersTable,
    DappsTable,
    NftsTable,
    ChainsTable,
    TestingTable,
  ],
  queries: {
    'newsCount': 'SELECT COUNT(*) FROM news_table n;',
    'articlesCount': 'SELECT COUNT(*) FROM articles_table n;',
    'eventsCount': 'SELECT COUNT(*) FROM events_table n;',
    'actionsCount': 'SELECT COUNT(*) FROM actions_table n;',
    'tweetsCount': 'SELECT COUNT(*) FROM tweets_table n;',
    'cronCount': 'SELECT COUNT(*) FROM cron_table n;',
    'radarsCount': 'SELECT COUNT(*) FROM radars_table n;'
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connect());

  @override
  int get schemaVersion => 16; // bump because the tables have changed.

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {
        await validateDatabaseSchema();
      },
    );
  }

  static final Provider<AppDatabase> provider = Provider((ref) {
    final database = AppDatabase();
    ref.onDispose(database.close);

    return database;
  });

  Future<void> clear() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  //! NEWS Functions
  Future<List<News>> getAllNews() => select(newsTable).get();

  Future<News> getNewsItem(String id) =>
      (select(newsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<List<News>> getNewsByProjectId(String id) => (select(newsTable)
        ..where((tbl) => tbl.projectId.equals(id))
        ..limit(5))
      .get();

  Future updateNewsUpdatedAt(String id) {
    return (update(newsTable)..where((tbl) => tbl.id.equals(id)))
        .write(NewsTableCompanion(updatedAt: Value(DateTime.now().toString())));
  }

  Future updateNewsComments(String id, Map<String, dynamic> data) {
    return (update(newsTable)..where((tbl) => tbl.id.equals(id))).write(
        NewsTableCompanion(
            comments: Value(data["comments"]),
            commentsCount: Value(data["commentsCount"]),
            discordThread: Value(data["discordThread"]),
            updatedAt: Value(DateTime.now().toString())));
  }

  Future viewNews(String id) {
    return (update(newsTable)..where((tbl) => tbl.id.equals(id)))
        .write(const NewsTableCompanion(viewed: Value(true)));
  }

  Future updateNewsItemByReplace(News entry) {
    return (update(newsTable)..where((t) => t.id.equals(entry.id))).write(
      NewsTableCompanion(
          title: Value(entry.title),
          urlImage: Value(entry.urlImage),
          projectId: Value(entry.projectId),
          viewed: Value(entry.viewed),
          urlSource: Value(entry.urlSource),
          createdAt: Value(entry.createdAt),
          updatedAt: Value(entry.updatedAt),
          comments: Value(entry.comments),
          commentsCount: Value(entry.commentsCount),
          discordThread: Value(entry.discordThread),
          publishedAt: Value(entry.publishedAt)),
    );
  }

  Future addNewsItem(News entry) => into(newsTable).insert(entry);

  //! ARTICLES Functions
  Future<List<Articles>> getAllArticles() => select(articlesTable).get();

  //* Commented for sake of testing (so it loads populated items)

  Future<List<Articles>> getLastArticles() => (select(articlesTable)
        // ..orderBy(([(t) => OrderingTerm(expression: t.createdAt)]))
        ..limit(2))
      .get();

  Future addArticlesItem(Articles entry) => into(articlesTable).insert(entry);

  Future updateArticlesItem(Articles entry) async {
    return (update(articlesTable)..where((t) => t.id.equals(entry.id))).write(
      ArticlesTableCompanion(
          title: Value(entry.title),
          subtitle: Value(entry.subtitle),
          content: Value(entry.content),
          createdAt: Value(entry.createdAt),
          updatedAt: Value(entry.updatedAt),
          link: Value(entry.link),
          viewed: Value(entry.viewed),
          entityId: Value(entry.entityId),
          entityType: Value(entry.entityType)),
    );
  }

  Future<Articles> getArticlesItem(String id) =>
      (select(articlesTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  //! EVENTS Functions

  Future<List<Events>> getAllEvents() => select(eventsTable).get();

  Future<Events> getEventsItem(String id) =>
      (select(eventsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<List<Events>> getLastEvents() => (select(eventsTable)..limit(2)).get();

  Future addEventItem(Events entry) => into(eventsTable).insert(entry);

  Future updateEventItem(Events entry) {
    return (update(eventsTable)..where((t) => t.id.equals(entry.id))).write(
      EventsTableCompanion(
          title: Value(entry.title),
          urlImage: Value(entry.urlImage),
          entities: Value(entry.entities),
          viewed: Value(entry.viewed),
          content: Value(entry.content),
          createdAt: Value(entry.createdAt),
          updatedAt: Value(entry.updatedAt),
          scheduledFor: Value(entry.scheduledFor)),
    );
  }

  //! ACTIONS Functions

  Future<List<Actions>> getAllActions() => select(actionsTable).get();

  Future replaceActionItem(Actions entry) =>
      update(actionsTable).replace(entry);

  Future<Actions> getActionsItem(String id) =>
      (select(actionsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future addActionsItem(Actions entry) => into(actionsTable).insert(entry);

  Future updateActionsItem(Actions entry) {
    return (update(actionsTable)..where((t) => t.id.equals(entry.id))).write(
      ActionsTableCompanion(
          author: Value(entry.author),
          urlIcon: Value(entry.urlIcon),
          content: Value(entry.content),
          createdAt: Value(entry.createdAt),
          updatedAt: Value(entry.updatedAt)),
    );
  }
  //! TWEETS Functions

  Future<List<Tweets>> getAllTweets() => select(tweetsTable).get();

  Future<Tweets> getTweetsItem(String id) =>
      (select(tweetsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future updateTweetsItem(Tweets entry) {
    {
      return (update(tweetsTable)..where((t) => t.id.equals(entry.id))).write(
        TweetsTableCompanion(
            author: Value(entry.author),
            urlIcon: Value(entry.urlIcon),
            content: Value(entry.content),
            createdAt: Value(entry.createdAt),
            updatedAt: Value(entry.updatedAt),
            postedAt: Value(entry.postedAt)),
      );
    }
  }

  Future addTweetsItem(Tweets entry) => into(tweetsTable).insert(entry);

  //! RADAR Functions
  Future<List<Radars>> getAllRadars() => select(radarsTable).get();

  Future<Radars> getRadarItem(String id) =>
      (select(radarsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future updateRadarItem(Radars entry) {
    {
      return (update(radarsTable)..where((t) => t.id.equals(entry.id))).write(
        RadarsTableCompanion(
            title: Value(entry.title),
            urlImage: Value(entry.urlImage),
            viewed: Value(entry.viewed),
            content: Value(entry.content),
            createdAt: Value(entry.createdAt),
            updatedAt: Value(entry.updatedAt)),
      );
    }
  }

  Future addRadarItem(Radars entry) => into(radarsTable).insert(entry);

  //! CRON Functions
  Future getAllCronItems() => select(cronTable).get();

  Future getCronItem(String name) =>
      (select(cronTable)..where((tbl) => tbl.name.equals(name))).getSingle();

  Future updateCronItem(Map params) {
    return (update(cronTable)..where((t) => t.name.equals(params["name"])))
        .write(
      CronTableCompanion(
        lastUpdated: Value(params['lastUpdated']),
      ),
    );
  }

  Future addCronItem(Cron entry) => into(cronTable).insert(entry);

  //! PRICE Functions
  Future<List<Prices>> getAllPrices() =>
      (select(pricesTable)..where((tbl) => tbl.price.isNotNull())).get();

  //! USERS Functions
  Future<Users?> getUser() => (select(usersTable)).getSingleOrNull();

  //! DAPPS Functions
  Future<List<Dapps>> getAllDapps() => select(dappsTable).get();

  Future<List<Dapps>> getLastDapps() => (select(dappsTable)..limit(2)).get();

  Future<Dapps> getDappItem(String id) =>
      (select(dappsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<List<Articles>> getArticlesForDapp(String id) => (select(articlesTable)
        ..where((tbl) => tbl.entityId.equals(id))
        ..where((tbl) => tbl.entityType.equals('dapp')))
      .get();

  Future addDappItem(Dapps entry) => into(dappsTable).insert(entry);

  Future<void> updateDappItem(Dapps entry) {
    return (update(dappsTable)..where((t) => t.id.equals(entry.id))).write(
      DappsTableCompanion(
          name: Value(entry.name),
          color: Value(entry.color),
          tokenName: Value(entry.tokenName),
          urlLogo: Value(entry.urlLogo),
          createdAt: Value(entry.createdAt),
          updatedAt: Value(entry.updatedAt)),
    );
  }

  //! CHAINS Functions
  Future<List<Chains>> getLastChains() => (select(chainsTable)..limit(2)).get();

  Future<Chains> getChainItem(String id) =>
      (select(chainsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<List<Articles>> getArticlesForChain(String id) =>
      (select(articlesTable)
            ..where((tbl) => tbl.entityId.equals(id))
            ..where((tbl) => tbl.entityType.equals('chain')))
          .get();

  //! NFTS Functions
  Future<List<Nfts>> getAllNfts() => select(nftsTable).get();

  Future<List<Nfts>> getLastNfts() => (select(nftsTable)..limit(2)).get();

  Future<List<Articles>> getArticlesForNft(String id) => (select(articlesTable)
        ..where((tbl) => tbl.entityId.equals(id))
        ..where((tbl) => tbl.entityType.equals('nft')))
      .get();

  Future<void> refreshUser() => (delete(usersTable)).go();

  Future<Nfts> getNftItem(String id) =>
      (select(nftsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future updateNftItem(Nfts entry) {
    return (update(nftsTable)..where((t) => t.id.equals(entry.id))).write(
      NftsTableCompanion(
          name: Value(entry.name),
          urlLogo: Value(entry.urlLogo),
          color: Value(entry.color),
          tokenName: Value(entry.tokenName),
          createdAt: Value(entry.createdAt),
          updatedAt: Value(entry.updatedAt)),
    );
  }

  //! TESTING Functions
  Future<List<Testing>> getTestEntries() => select(testingTable).get();

  Future addTestEntry() => into(testingTable).insert(
      Testing(id: Random().nextInt(100).toString(), testField: "TestField"));

  Future addNftItem(Nfts entry) => into(nftsTable).insert(entry);

  Future<int> saveUser(UsersModel user) async {
    UsersTableCompanion tableCompanion = UsersTableCompanion(
        id: Value(user.id),
        discordId: Value(user.discordId),
        discordName: Value(user.discordName),
        discordRole: Value(user.discordRole),
        email: Value(user.email),
        instagramValidated: Value(user.instagramValidated),
        instagramValidation: Value(user.instagramValidation),
        setupComplete: Value(user.setupComplete),
        avatarUrl: Value(user.avatarUrl));
    return into(usersTable).insert(tableCompanion);
  }
}

Future<File> get databaseFile async {
  final appDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(appDir.path, 'app.db');
  return File(dbPath);
}

DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    return NativeDatabase.createBackgroundConnection(await databaseFile);
  }));
}
