// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsModel _$$_NewsModelFromJson(Map<String, dynamic> json) => _$_NewsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      urlImage: json['url_image'] as String,
      urlSource: json['url_source'] as String,
      viewed: json['viewed'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      publishedAt: json['published_at'] as String,
      comments: json['comments'] as List<dynamic>?,
      commentsCount: json['comments_count'] as int?,
      discordThread: json['discord_thread'] as String?,
      projectId: json['project_id'] as String?,
    );

Map<String, dynamic> _$$_NewsModelToJson(_$_NewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url_image': instance.urlImage,
      'url_source': instance.urlSource,
      'viewed': instance.viewed,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'published_at': instance.publishedAt,
      'comments': instance.comments,
      'comments_count': instance.commentsCount,
      'discord_thread': instance.discordThread,
      'project_id': instance.projectId,
    };

_$_ArticlesModel _$$_ArticlesModelFromJson(Map<String, dynamic> json) =>
    _$_ArticlesModel(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      urlImage: json['url_image'] as String,
      link: json['link'] as String,
      entityType: json['entity_type'] as String,
      entityId: json['entity_id'] as String,
      viewed: json['viewed'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_ArticlesModelToJson(_$_ArticlesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'url_image': instance.urlImage,
      'link': instance.link,
      'entity_type': instance.entityType,
      'entity_id': instance.entityId,
      'viewed': instance.viewed,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'content': instance.content,
    };

_$_ChainsModel _$$_ChainsModelFromJson(Map<String, dynamic> json) =>
    _$_ChainsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      tokenName: json['token_name'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      urlLogo: json['url_logo'] as String,
    );

Map<String, dynamic> _$$_ChainsModelToJson(_$_ChainsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'token_name': instance.tokenName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'url_logo': instance.urlLogo,
    };

_$_DappsModel _$$_DappsModelFromJson(Map<String, dynamic> json) =>
    _$_DappsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      tokenName: json['token_name'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      urlLogo: json['url_logo'] as String,
    );

Map<String, dynamic> _$$_DappsModelToJson(_$_DappsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'token_name': instance.tokenName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'url_logo': instance.urlLogo,
    };

_$_NftsModel _$$_NftsModelFromJson(Map<String, dynamic> json) => _$_NftsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      tokenName: json['token_name'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      urlLogo: json['url_logo'] as String,
    );

Map<String, dynamic> _$$_NftsModelToJson(_$_NftsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'token_name': instance.tokenName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'url_logo': instance.urlLogo,
    };

_$_EventsModel _$$_EventsModelFromJson(Map<String, dynamic> json) =>
    _$_EventsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      entities: json['entities'] as Map<String, dynamic>?,
      scheduledFor: json['scheduled_for'] as String,
      content: json['content'] as String,
      viewed: json['viewed'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      urlImage: json['url_image'] as String,
    );

Map<String, dynamic> _$$_EventsModelToJson(_$_EventsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'entities': instance.entities,
      'scheduled_for': instance.scheduledFor,
      'content': instance.content,
      'viewed': instance.viewed,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'url_image': instance.urlImage,
    };

_$_RadarModel _$$_RadarModelFromJson(Map<String, dynamic> json) =>
    _$_RadarModel(
      id: json['id'] as String,
      content: json['content'] as List<dynamic>?,
      title: json['title'] as String,
      viewed: json['viewed'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      urlImage: json['url_image'] as String,
    );

Map<String, dynamic> _$$_RadarModelToJson(_$_RadarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'title': instance.title,
      'viewed': instance.viewed,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'url_image': instance.urlImage,
    };

_$_TweetsModel _$$_TweetsModelFromJson(Map<String, dynamic> json) =>
    _$_TweetsModel(
      id: json['id'] as String,
      author: json['author'] as String,
      urlIcon: json['url_icon'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      postedAt: json['posted_at'] as String,
    );

Map<String, dynamic> _$$_TweetsModelToJson(_$_TweetsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'url_icon': instance.urlIcon,
      'content': instance.content,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'posted_at': instance.postedAt,
    };

_$_ActionsModel _$$_ActionsModelFromJson(Map<String, dynamic> json) =>
    _$_ActionsModel(
      id: json['id'] as String,
      author: json['author'] as String,
      urlIcon: json['url_icon'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$_ActionsModelToJson(_$_ActionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'url_icon': instance.urlIcon,
      'content': instance.content,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$_CronModel _$$_CronModelFromJson(Map<String, dynamic> json) => _$_CronModel(
      id: json['id'] as String,
      tableName: json['table_name'] as String,
      lastUpdated: json['last_updated'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$_CronModelToJson(_$_CronModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'table_name': instance.tableName,
      'last_updated': instance.lastUpdated,
      'created_at': instance.createdAt,
    };

_$_CurrencyPillModel _$$_CurrencyPillModelFromJson(Map<String, dynamic> json) =>
    _$_CurrencyPillModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      price: json['price'] as String,
      symbol: json['symbol'] as String,
      isPriceUp: json['is_price_up'] as bool,
    );

Map<String, dynamic> _$$_CurrencyPillModelToJson(
        _$_CurrencyPillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'price': instance.price,
      'symbol': instance.symbol,
      'is_price_up': instance.isPriceUp,
    };

_$_UsersModel _$$_UsersModelFromJson(Map<String, dynamic> json) =>
    _$_UsersModel(
      id: json['id'] as String,
      discordId: json['discord_id'] as String,
      discordName: json['discord_name'] as String,
      discordRole: json['discord_role'] as String,
      email: json['email'] as String,
      instagramValidation: json['instagram_validation'] as String,
      instagramValidated: json['instagram_validated'] as bool,
      setupComplete: json['setup_complete'] as bool,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$_UsersModelToJson(_$_UsersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discord_id': instance.discordId,
      'discord_name': instance.discordName,
      'discord_role': instance.discordRole,
      'email': instance.email,
      'instagram_validation': instance.instagramValidation,
      'instagram_validated': instance.instagramValidated,
      'setup_complete': instance.setupComplete,
      'avatar_url': instance.avatarUrl,
    };
