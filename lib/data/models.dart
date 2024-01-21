// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:bt_app/utils/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.g.dart';
part 'models.freezed.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "url_image") required String urlImage,
    @JsonKey(name: "url_source", includeIfNull: false)
        required String urlSource,
    @JsonKey(name: "viewed") required bool viewed,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "published_at") required String publishedAt,
    @JsonKey(name: "comments", includeIfNull: true) List? comments,
    @JsonKey(name: "comments_count", includeIfNull: true) int? commentsCount,
    @JsonKey(name: "discord_thread", includeIfNull: true) String? discordThread,
    @JsonKey(name: "project_id") String? projectId,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  factory NewsModel.fromTable(News tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$NewsModelFromJson(tableJson);
  }
}

@freezed
class ArticlesModel with _$ArticlesModel {
  const factory ArticlesModel({
    required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "subtitle") required String subtitle,
    // @JsonKey(name: "color") required String color,
    @JsonKey(name: "url_image") required String urlImage,
    @JsonKey(name: "link") required String link,
    @JsonKey(name: "entity_type") required String entityType,
    @JsonKey(name: "entity_id") required String entityId,
    @JsonKey(name: "viewed", includeIfNull: false) required bool viewed,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "content") required String content,
  }) = _ArticlesModel;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesModelFromJson(json);

  factory ArticlesModel.fromTable(Articles tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$ArticlesModelFromJson(tableJson);
  }
}

@freezed
class ChainsModel with _$ChainsModel {
  const factory ChainsModel({
    required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "color") required String color,
    @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "url_logo") required String urlLogo,
  }) = _ChainsModel;

  factory ChainsModel.fromJson(Map<String, dynamic> json) =>
      _$ChainsModelFromJson(json);

  factory ChainsModel.fromTable(Chains tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$ChainsModelFromJson(tableJson);
  }
}

@freezed
class DappsModel with _$DappsModel {
  const factory DappsModel({
    required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "color") required String color,
    @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "url_logo") required String urlLogo,
  }) = _DappsModel;

  factory DappsModel.fromJson(Map<String, dynamic> json) =>
      _$DappsModelFromJson(json);

  factory DappsModel.fromTable(Dapps tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$DappsModelFromJson(tableJson);
  }
}

@freezed
class NftsModel with _$NftsModel {
  const factory NftsModel({
    required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "color") required String color,
    @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "url_logo") required String urlLogo,
  }) = _NftsModel;

  factory NftsModel.fromJson(Map<String, dynamic> json) =>
      _$NftsModelFromJson(json);

  factory NftsModel.fromTable(Nfts tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$NftsModelFromJson(tableJson);
  }
}

@freezed
class EventsModel with _$EventsModel {
  const factory EventsModel({
    required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "entities", includeIfNull: true)
        Map<String, dynamic>? entities,
    @JsonKey(name: "scheduled_for") required String scheduledFor,
    // @JsonKey(name: "color") required String color,
    @JsonKey(name: "content") required String content,
    @JsonKey(name: "viewed", includeIfNull: false) required bool viewed,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "url_image") required String urlImage,
  }) = _EventsModel;

  factory EventsModel.fromJson(Map<String, dynamic> json) =>
      _$EventsModelFromJson(json);

  factory EventsModel.fromTable(Events tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    tableJson["entities"] = jsonDecode(tableJson["entities"]);
    return _$EventsModelFromJson(tableJson);
  }
}

@freezed
class RadarsModel with _$RadarsModel {
  const factory RadarsModel({
    required String id,
    @JsonKey(name: "content") List? content,
    // @JsonKey(name: "color") required String color,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "viewed", includeIfNull: false) required bool viewed,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "url_image") required String urlImage,
  }) = _RadarModel;

  factory RadarsModel.fromJson(Map<String, dynamic> json) =>
      _$RadarsModelFromJson(json);

  factory RadarsModel.fromTable(Radars tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    tableJson["content"] = jsonDecode(tableJson["content"]);
    return _$RadarsModelFromJson(tableJson);
  }
}

@freezed
class TweetsModel with _$TweetsModel {
  const factory TweetsModel({
    required String id,
    @JsonKey(name: "author") required String author,
    @JsonKey(name: "url_icon") required String urlIcon,
    @JsonKey(name: "content") required String content,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "posted_at") required String postedAt,
  }) = _TweetsModel;

  factory TweetsModel.fromJson(Map<String, dynamic> json) =>
      _$TweetsModelFromJson(json);

  factory TweetsModel.fromTable(Tweets tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$TweetsModelFromJson(tableJson);
  }
}

@freezed
class ActionsModel with _$ActionsModel {
  const factory ActionsModel({
    required String id,
    @JsonKey(name: "author") required String author,
    @JsonKey(name: "url_icon") required String urlIcon,
    @JsonKey(name: "content") required String content,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
  }) = _ActionsModel;

  factory ActionsModel.fromJson(Map<String, dynamic> json) =>
      _$ActionsModelFromJson(json);

  factory ActionsModel.fromTable(Actions tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$ActionsModelFromJson(tableJson);
  }
}

@freezed
class CronModel with _$CronModel {
  const factory CronModel({
    required String id,
    @JsonKey(name: "table_name") required String tableName,
    @JsonKey(name: "last_updated") required String lastUpdated,
    @JsonKey(name: "created_at") required String createdAt,
  }) = _CronModel;

  factory CronModel.fromJson(Map<String, dynamic> json) =>
      _$CronModelFromJson(json);

  factory CronModel.fromTable(Cron tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$CronModelFromJson(tableJson);
  }
}

@freezed
class CurrencyPillModel with _$CurrencyPillModel {
  const factory CurrencyPillModel({
    required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "icon") required String icon,
    @JsonKey(name: "price") required String price,
    @JsonKey(name: "symbol") required String symbol,
    @JsonKey(name: "is_price_up") required bool isPriceUp,
  }) = _CurrencyPillModel;

  factory CurrencyPillModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyPillModelFromJson(json);

  factory CurrencyPillModel.fromTable(Prices tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$CurrencyPillModelFromJson(tableJson);
  }
}

@freezed
class UsersModel with _$UsersModel {
  const factory UsersModel({
    required String id,
    @JsonKey(name: "discord_id") required String discordId,
    @JsonKey(name: "discord_name") required String discordName,
    @JsonKey(name: "discord_role") required String discordRole,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "instagram_validation") required String instagramValidation,
    @JsonKey(name: "instagram_validated") required bool instagramValidated,
    @JsonKey(name: "setup_complete") required bool setupComplete,
    @JsonKey(name: "avatar_url") required String avatarUrl,
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  factory UsersModel.fromTable(Users tableEntry) {
    Map<String, dynamic> tableJson = tableEntry.toJson();
    return _$UsersModelFromJson(tableJson);
  }
}

class StatsModel {
  String category = '';
  int number = 0;
  String text = '';
  String icon = '';
  String route;

  StatsModel({
    required this.category,
    required this.number,
    required this.text,
    required this.icon,
    required this.route,
  });
}
