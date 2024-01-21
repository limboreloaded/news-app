import 'package:drift/drift.dart';

@DataClassName('News')
class NewsTable extends Table {
  TextColumn get id => text()();
  @JsonKey("url_image")
  TextColumn get urlImage => text()();
  @JsonKey("title")
  TextColumn get title => text()();
  @JsonKey("viewed")
  BoolColumn get viewed =>
      boolean().nullable().withDefault(const Constant(false))();
  @JsonKey("project_id")
  TextColumn get projectId => text().nullable()();
  @JsonKey("url_source")
  TextColumn get urlSource => text().nullable()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
  @JsonKey("comments")
  TextColumn get comments => text().nullable()();
  @JsonKey("comments_count")
  IntColumn get commentsCount => integer().nullable()();
  @JsonKey("discord_thread")
  TextColumn get discordThread => text().nullable()();
  @JsonKey("published_at")
  TextColumn get publishedAt => text().nullable()();
}

@DataClassName('Articles')

/// Docs:
/// Note that using [named] __does not__ have an effect on the json key of an
/// object. To change the json key, annotate this column getter with
/// [JsonKey].
class ArticlesTable extends Table {
  TextColumn get id => text()();
  @JsonKey("title")
  TextColumn get title => text()();
  @JsonKey("subtitle")
  TextColumn get subtitle => text()();
  @JsonKey("link")
  TextColumn get link => text()();
  @JsonKey("viewed")
  BoolColumn get viewed =>
      boolean().nullable().withDefault(const Constant(false))();
  @JsonKey("content")
  TextColumn get content => text()();
  // @JsonKey("color")
  // TextColumn get color => text()();
  @JsonKey("url_image")
  TextColumn get urlImage => text()();
  @JsonKey("entity_type")
  TextColumn get entityType => text()();
  @JsonKey("entity_id")
  TextColumn get entityId => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
}

@DataClassName('Events')
class EventsTable extends Table {
  TextColumn get id => text()();
  @JsonKey("entities")
  TextColumn get entities => text().nullable()();
  @JsonKey("viewed")
  BoolColumn get viewed =>
      boolean().nullable().withDefault(const Constant(false))();
  @JsonKey("title")
  TextColumn get title => text()();
  @JsonKey("content")
  TextColumn get content => text()();
  // @JsonKey("color")
  // TextColumn get color => text()();
  @JsonKey("url_image")
  TextColumn get urlImage => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
  @JsonKey("scheduled_for")
  TextColumn get scheduledFor => text()();
}

@DataClassName('Radars')
class RadarsTable extends Table {
  TextColumn get id => text()();
  @JsonKey("title")
  TextColumn get title => text()();
  @JsonKey("viewed")
  BoolColumn get viewed =>
      boolean().nullable().withDefault(const Constant(false))();
  @JsonKey("content")
  TextColumn get content => text()();
  // @JsonKey("color")
  // TextColumn get color => text()();
  @JsonKey("url_image")
  TextColumn get urlImage => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
}

@DataClassName('Tweets')
class TweetsTable extends Table {
  TextColumn get id => text()();
  @JsonKey("author")
  TextColumn get author => text().withLength(min: 2, max: 20)();
  @JsonKey("url_icon")
  TextColumn get urlIcon => text()();
  @JsonKey("content")
  TextColumn get content => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
  @JsonKey("posted_at")
  TextColumn get postedAt => text()();
}

@DataClassName('Actions')
class ActionsTable extends Table {
  TextColumn get id => text()();
  @JsonKey("author")
  TextColumn get author => text().withLength(min: 2, max: 20)();
  @JsonKey("url_icon")
  TextColumn get urlIcon => text()();
  @JsonKey("content")
  TextColumn get content => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
}

@DataClassName('Cron')
class CronTable extends Table {
  TextColumn get id => text()();
  @JsonKey("table_name")
  TextColumn get name => text()();
  @JsonKey("last_updated")
  TextColumn get lastUpdated => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
}

@DataClassName('Prices')
class PricesTable extends Table {
  TextColumn get id => text()();
  @JsonKey("price")
  TextColumn get price => text().nullable()();
  @JsonKey("name")
  TextColumn get name => text()();
  @JsonKey("icon")
  TextColumn get icon => text()();
  @JsonKey("symbol")
  TextColumn get symbol => text().withLength(min: 2, max: 10)();
  @JsonKey("is_price_up")
  BoolColumn get isPriceUp => boolean().nullable()();
}

@DataClassName('Users')
class UsersTable extends Table {
  TextColumn get id => text()();
  @JsonKey("discord_id")
  TextColumn get discordId => text()();
  @JsonKey("discord_name")
  TextColumn get discordName => text()();
  @JsonKey("discord_role")
  TextColumn get discordRole => text()();
  @JsonKey("email")
  TextColumn get email => text()();
  @JsonKey("instagram_validation")
  TextColumn get instagramValidation => text()();
  @JsonKey("instagram_validated")
  BoolColumn get instagramValidated => boolean()();
  @JsonKey("setup_complete")
  BoolColumn get setupComplete => boolean()();
  @JsonKey("avatar_url")
  TextColumn get avatarUrl => text()();
}

@DataClassName('Dapps')
class DappsTable extends Table {
  TextColumn get id => text()();
  @JsonKey("name")
  TextColumn get name => text()();
  @JsonKey("color")
  TextColumn get color => text()();
  @JsonKey("token_name")
  TextColumn get tokenName => text().nullable()();
  @JsonKey("url_logo")
  TextColumn get urlLogo => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
}

@DataClassName('Chains')
class ChainsTable extends Table {
  TextColumn get id => text()();
  @JsonKey("name")
  TextColumn get name => text()();
  @JsonKey("color")
  TextColumn get color => text()();
  @JsonKey("token_name")
  TextColumn get tokenName => text().nullable()();
  @JsonKey("url_logo")
  TextColumn get urlLogo => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
}

@DataClassName('Nfts')
class NftsTable extends Table {
  TextColumn get id => text()();
  @JsonKey("name")
  TextColumn get name => text()();
  @JsonKey("color")
  TextColumn get color => text()();
  @JsonKey("token_name")
  TextColumn get tokenName => text().nullable()();
  @JsonKey("url_logo")
  TextColumn get urlLogo => text()();
  @JsonKey("created_at")
  TextColumn get createdAt => text()();
  @JsonKey("updated_at")
  TextColumn get updatedAt => text()();
}

@DataClassName('Testing')
class TestingTable extends Table {
  TextColumn get id => text()();
  @JsonKey("test_field")
  TextColumn get testField => text()();
}
