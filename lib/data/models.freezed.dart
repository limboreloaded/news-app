// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
mixin _$NewsModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "url_image")
  String get urlImage => throw _privateConstructorUsedError;
  @JsonKey(name: "url_source", includeIfNull: false)
  String get urlSource => throw _privateConstructorUsedError;
  @JsonKey(name: "viewed")
  bool get viewed => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "published_at")
  String get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "comments", includeIfNull: true)
  List<dynamic>? get comments => throw _privateConstructorUsedError;
  @JsonKey(name: "comments_count", includeIfNull: true)
  int? get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "discord_thread", includeIfNull: true)
  String? get discordThread => throw _privateConstructorUsedError;
  @JsonKey(name: "project_id")
  String? get projectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res, NewsModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "title")
          String title,
      @JsonKey(name: "url_image")
          String urlImage,
      @JsonKey(name: "url_source", includeIfNull: false)
          String urlSource,
      @JsonKey(name: "viewed")
          bool viewed,
      @JsonKey(name: "created_at")
          String createdAt,
      @JsonKey(name: "updated_at")
          String updatedAt,
      @JsonKey(name: "published_at")
          String publishedAt,
      @JsonKey(name: "comments", includeIfNull: true)
          List<dynamic>? comments,
      @JsonKey(name: "comments_count", includeIfNull: true)
          int? commentsCount,
      @JsonKey(name: "discord_thread", includeIfNull: true)
          String? discordThread,
      @JsonKey(name: "project_id")
          String? projectId});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res, $Val extends NewsModel>
    implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? urlImage = null,
    Object? urlSource = null,
    Object? viewed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = null,
    Object? comments = freezed,
    Object? commentsCount = freezed,
    Object? discordThread = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
      urlSource: null == urlSource
          ? _value.urlSource
          : urlSource // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      discordThread: freezed == discordThread
          ? _value.discordThread
          : discordThread // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsModelCopyWith<$Res> implements $NewsModelCopyWith<$Res> {
  factory _$$_NewsModelCopyWith(
          _$_NewsModel value, $Res Function(_$_NewsModel) then) =
      __$$_NewsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "title")
          String title,
      @JsonKey(name: "url_image")
          String urlImage,
      @JsonKey(name: "url_source", includeIfNull: false)
          String urlSource,
      @JsonKey(name: "viewed")
          bool viewed,
      @JsonKey(name: "created_at")
          String createdAt,
      @JsonKey(name: "updated_at")
          String updatedAt,
      @JsonKey(name: "published_at")
          String publishedAt,
      @JsonKey(name: "comments", includeIfNull: true)
          List<dynamic>? comments,
      @JsonKey(name: "comments_count", includeIfNull: true)
          int? commentsCount,
      @JsonKey(name: "discord_thread", includeIfNull: true)
          String? discordThread,
      @JsonKey(name: "project_id")
          String? projectId});
}

/// @nodoc
class __$$_NewsModelCopyWithImpl<$Res>
    extends _$NewsModelCopyWithImpl<$Res, _$_NewsModel>
    implements _$$_NewsModelCopyWith<$Res> {
  __$$_NewsModelCopyWithImpl(
      _$_NewsModel _value, $Res Function(_$_NewsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? urlImage = null,
    Object? urlSource = null,
    Object? viewed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = null,
    Object? comments = freezed,
    Object? commentsCount = freezed,
    Object? discordThread = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_$_NewsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
      urlSource: null == urlSource
          ? _value.urlSource
          : urlSource // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      discordThread: freezed == discordThread
          ? _value.discordThread
          : discordThread // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsModel implements _NewsModel {
  const _$_NewsModel(
      {required this.id,
      @JsonKey(name: "title")
          required this.title,
      @JsonKey(name: "url_image")
          required this.urlImage,
      @JsonKey(name: "url_source", includeIfNull: false)
          required this.urlSource,
      @JsonKey(name: "viewed")
          required this.viewed,
      @JsonKey(name: "created_at")
          required this.createdAt,
      @JsonKey(name: "updated_at")
          required this.updatedAt,
      @JsonKey(name: "published_at")
          required this.publishedAt,
      @JsonKey(name: "comments", includeIfNull: true)
          final List<dynamic>? comments,
      @JsonKey(name: "comments_count", includeIfNull: true)
          this.commentsCount,
      @JsonKey(name: "discord_thread", includeIfNull: true)
          this.discordThread,
      @JsonKey(name: "project_id")
          this.projectId})
      : _comments = comments;

  factory _$_NewsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewsModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "url_image")
  final String urlImage;
  @override
  @JsonKey(name: "url_source", includeIfNull: false)
  final String urlSource;
  @override
  @JsonKey(name: "viewed")
  final bool viewed;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "published_at")
  final String publishedAt;
  final List<dynamic>? _comments;
  @override
  @JsonKey(name: "comments", includeIfNull: true)
  List<dynamic>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "comments_count", includeIfNull: true)
  final int? commentsCount;
  @override
  @JsonKey(name: "discord_thread", includeIfNull: true)
  final String? discordThread;
  @override
  @JsonKey(name: "project_id")
  final String? projectId;

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, urlImage: $urlImage, urlSource: $urlSource, viewed: $viewed, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, comments: $comments, commentsCount: $commentsCount, discordThread: $discordThread, projectId: $projectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.urlImage, urlImage) ||
                other.urlImage == urlImage) &&
            (identical(other.urlSource, urlSource) ||
                other.urlSource == urlSource) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.discordThread, discordThread) ||
                other.discordThread == discordThread) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      urlImage,
      urlSource,
      viewed,
      createdAt,
      updatedAt,
      publishedAt,
      const DeepCollectionEquality().hash(_comments),
      commentsCount,
      discordThread,
      projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsModelCopyWith<_$_NewsModel> get copyWith =>
      __$$_NewsModelCopyWithImpl<_$_NewsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsModelToJson(
      this,
    );
  }
}

abstract class _NewsModel implements NewsModel {
  const factory _NewsModel(
      {required final String id,
      @JsonKey(name: "title")
          required final String title,
      @JsonKey(name: "url_image")
          required final String urlImage,
      @JsonKey(name: "url_source", includeIfNull: false)
          required final String urlSource,
      @JsonKey(name: "viewed")
          required final bool viewed,
      @JsonKey(name: "created_at")
          required final String createdAt,
      @JsonKey(name: "updated_at")
          required final String updatedAt,
      @JsonKey(name: "published_at")
          required final String publishedAt,
      @JsonKey(name: "comments", includeIfNull: true)
          final List<dynamic>? comments,
      @JsonKey(name: "comments_count", includeIfNull: true)
          final int? commentsCount,
      @JsonKey(name: "discord_thread", includeIfNull: true)
          final String? discordThread,
      @JsonKey(name: "project_id")
          final String? projectId}) = _$_NewsModel;

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$_NewsModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "url_image")
  String get urlImage;
  @override
  @JsonKey(name: "url_source", includeIfNull: false)
  String get urlSource;
  @override
  @JsonKey(name: "viewed")
  bool get viewed;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "published_at")
  String get publishedAt;
  @override
  @JsonKey(name: "comments", includeIfNull: true)
  List<dynamic>? get comments;
  @override
  @JsonKey(name: "comments_count", includeIfNull: true)
  int? get commentsCount;
  @override
  @JsonKey(name: "discord_thread", includeIfNull: true)
  String? get discordThread;
  @override
  @JsonKey(name: "project_id")
  String? get projectId;
  @override
  @JsonKey(ignore: true)
  _$$_NewsModelCopyWith<_$_NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticlesModel _$ArticlesModelFromJson(Map<String, dynamic> json) {
  return _ArticlesModel.fromJson(json);
}

/// @nodoc
mixin _$ArticlesModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "subtitle")
  String get subtitle =>
      throw _privateConstructorUsedError; // @JsonKey(name: "color") required String color,
  @JsonKey(name: "url_image")
  String get urlImage => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_type")
  String get entityType => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_id")
  String get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "viewed", includeIfNull: false)
  bool get viewed => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlesModelCopyWith<ArticlesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesModelCopyWith<$Res> {
  factory $ArticlesModelCopyWith(
          ArticlesModel value, $Res Function(ArticlesModel) then) =
      _$ArticlesModelCopyWithImpl<$Res, ArticlesModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "subtitle") String subtitle,
      @JsonKey(name: "url_image") String urlImage,
      @JsonKey(name: "link") String link,
      @JsonKey(name: "entity_type") String entityType,
      @JsonKey(name: "entity_id") String entityId,
      @JsonKey(name: "viewed", includeIfNull: false) bool viewed,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "content") String content});
}

/// @nodoc
class _$ArticlesModelCopyWithImpl<$Res, $Val extends ArticlesModel>
    implements $ArticlesModelCopyWith<$Res> {
  _$ArticlesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? urlImage = null,
    Object? link = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? viewed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticlesModelCopyWith<$Res>
    implements $ArticlesModelCopyWith<$Res> {
  factory _$$_ArticlesModelCopyWith(
          _$_ArticlesModel value, $Res Function(_$_ArticlesModel) then) =
      __$$_ArticlesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "subtitle") String subtitle,
      @JsonKey(name: "url_image") String urlImage,
      @JsonKey(name: "link") String link,
      @JsonKey(name: "entity_type") String entityType,
      @JsonKey(name: "entity_id") String entityId,
      @JsonKey(name: "viewed", includeIfNull: false) bool viewed,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "content") String content});
}

/// @nodoc
class __$$_ArticlesModelCopyWithImpl<$Res>
    extends _$ArticlesModelCopyWithImpl<$Res, _$_ArticlesModel>
    implements _$$_ArticlesModelCopyWith<$Res> {
  __$$_ArticlesModelCopyWithImpl(
      _$_ArticlesModel _value, $Res Function(_$_ArticlesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? urlImage = null,
    Object? link = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? viewed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? content = null,
  }) {
    return _then(_$_ArticlesModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticlesModel implements _ArticlesModel {
  const _$_ArticlesModel(
      {required this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "subtitle") required this.subtitle,
      @JsonKey(name: "url_image") required this.urlImage,
      @JsonKey(name: "link") required this.link,
      @JsonKey(name: "entity_type") required this.entityType,
      @JsonKey(name: "entity_id") required this.entityId,
      @JsonKey(name: "viewed", includeIfNull: false) required this.viewed,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "content") required this.content});

  factory _$_ArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$$_ArticlesModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "subtitle")
  final String subtitle;
// @JsonKey(name: "color") required String color,
  @override
  @JsonKey(name: "url_image")
  final String urlImage;
  @override
  @JsonKey(name: "link")
  final String link;
  @override
  @JsonKey(name: "entity_type")
  final String entityType;
  @override
  @JsonKey(name: "entity_id")
  final String entityId;
  @override
  @JsonKey(name: "viewed", includeIfNull: false)
  final bool viewed;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "content")
  final String content;

  @override
  String toString() {
    return 'ArticlesModel(id: $id, title: $title, subtitle: $subtitle, urlImage: $urlImage, link: $link, entityType: $entityType, entityId: $entityId, viewed: $viewed, createdAt: $createdAt, updatedAt: $updatedAt, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticlesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.urlImage, urlImage) ||
                other.urlImage == urlImage) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, subtitle, urlImage,
      link, entityType, entityId, viewed, createdAt, updatedAt, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticlesModelCopyWith<_$_ArticlesModel> get copyWith =>
      __$$_ArticlesModelCopyWithImpl<_$_ArticlesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticlesModelToJson(
      this,
    );
  }
}

abstract class _ArticlesModel implements ArticlesModel {
  const factory _ArticlesModel(
      {required final String id,
      @JsonKey(name: "title")
          required final String title,
      @JsonKey(name: "subtitle")
          required final String subtitle,
      @JsonKey(name: "url_image")
          required final String urlImage,
      @JsonKey(name: "link")
          required final String link,
      @JsonKey(name: "entity_type")
          required final String entityType,
      @JsonKey(name: "entity_id")
          required final String entityId,
      @JsonKey(name: "viewed", includeIfNull: false)
          required final bool viewed,
      @JsonKey(name: "created_at")
          required final String createdAt,
      @JsonKey(name: "updated_at")
          required final String updatedAt,
      @JsonKey(name: "content")
          required final String content}) = _$_ArticlesModel;

  factory _ArticlesModel.fromJson(Map<String, dynamic> json) =
      _$_ArticlesModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "subtitle")
  String get subtitle;
  @override // @JsonKey(name: "color") required String color,
  @JsonKey(name: "url_image")
  String get urlImage;
  @override
  @JsonKey(name: "link")
  String get link;
  @override
  @JsonKey(name: "entity_type")
  String get entityType;
  @override
  @JsonKey(name: "entity_id")
  String get entityId;
  @override
  @JsonKey(name: "viewed", includeIfNull: false)
  bool get viewed;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "content")
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_ArticlesModelCopyWith<_$_ArticlesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ChainsModel _$ChainsModelFromJson(Map<String, dynamic> json) {
  return _ChainsModel.fromJson(json);
}

/// @nodoc
mixin _$ChainsModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: "token_name", includeIfNull: true)
  String? get tokenName => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "url_logo")
  String get urlLogo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChainsModelCopyWith<ChainsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainsModelCopyWith<$Res> {
  factory $ChainsModelCopyWith(
          ChainsModel value, $Res Function(ChainsModel) then) =
      _$ChainsModelCopyWithImpl<$Res, ChainsModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "url_logo") String urlLogo});
}

/// @nodoc
class _$ChainsModelCopyWithImpl<$Res, $Val extends ChainsModel>
    implements $ChainsModelCopyWith<$Res> {
  _$ChainsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? tokenName = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlLogo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlLogo: null == urlLogo
          ? _value.urlLogo
          : urlLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChainsModelCopyWith<$Res>
    implements $ChainsModelCopyWith<$Res> {
  factory _$$_ChainsModelCopyWith(
          _$_ChainsModel value, $Res Function(_$_ChainsModel) then) =
      __$$_ChainsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "url_logo") String urlLogo});
}

/// @nodoc
class __$$_ChainsModelCopyWithImpl<$Res>
    extends _$ChainsModelCopyWithImpl<$Res, _$_ChainsModel>
    implements _$$_ChainsModelCopyWith<$Res> {
  __$$_ChainsModelCopyWithImpl(
      _$_ChainsModel _value, $Res Function(_$_ChainsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? tokenName = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlLogo = null,
  }) {
    return _then(_$_ChainsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlLogo: null == urlLogo
          ? _value.urlLogo
          : urlLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChainsModel implements _ChainsModel {
  const _$_ChainsModel(
      {required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "color") required this.color,
      @JsonKey(name: "token_name", includeIfNull: true) this.tokenName,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "url_logo") required this.urlLogo});

  factory _$_ChainsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChainsModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "color")
  final String color;
  @override
  @JsonKey(name: "token_name", includeIfNull: true)
  final String? tokenName;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "url_logo")
  final String urlLogo;

  @override
  String toString() {
    return 'ChainsModel(id: $id, name: $name, color: $color, tokenName: $tokenName, createdAt: $createdAt, updatedAt: $updatedAt, urlLogo: $urlLogo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChainsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.urlLogo, urlLogo) || other.urlLogo == urlLogo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, color, tokenName, createdAt, updatedAt, urlLogo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChainsModelCopyWith<_$_ChainsModel> get copyWith =>
      __$$_ChainsModelCopyWithImpl<_$_ChainsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChainsModelToJson(
      this,
    );
  }
}

abstract class _ChainsModel implements ChainsModel {
  const factory _ChainsModel(
      {required final String id,
      @JsonKey(name: "name")
          required final String name,
      @JsonKey(name: "color")
          required final String color,
      @JsonKey(name: "token_name", includeIfNull: true)
          final String? tokenName,
      @JsonKey(name: "created_at")
          required final String createdAt,
      @JsonKey(name: "updated_at")
          required final String updatedAt,
      @JsonKey(name: "url_logo")
          required final String urlLogo}) = _$_ChainsModel;

  factory _ChainsModel.fromJson(Map<String, dynamic> json) =
      _$_ChainsModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "color")
  String get color;
  @override
  @JsonKey(name: "token_name", includeIfNull: true)
  String? get tokenName;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "url_logo")
  String get urlLogo;
  @override
  @JsonKey(ignore: true)
  _$$_ChainsModelCopyWith<_$_ChainsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DappsModel _$DappsModelFromJson(Map<String, dynamic> json) {
  return _DappsModel.fromJson(json);
}

/// @nodoc
mixin _$DappsModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: "token_name", includeIfNull: true)
  String? get tokenName => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "url_logo")
  String get urlLogo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DappsModelCopyWith<DappsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DappsModelCopyWith<$Res> {
  factory $DappsModelCopyWith(
          DappsModel value, $Res Function(DappsModel) then) =
      _$DappsModelCopyWithImpl<$Res, DappsModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "url_logo") String urlLogo});
}

/// @nodoc
class _$DappsModelCopyWithImpl<$Res, $Val extends DappsModel>
    implements $DappsModelCopyWith<$Res> {
  _$DappsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? tokenName = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlLogo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlLogo: null == urlLogo
          ? _value.urlLogo
          : urlLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DappsModelCopyWith<$Res>
    implements $DappsModelCopyWith<$Res> {
  factory _$$_DappsModelCopyWith(
          _$_DappsModel value, $Res Function(_$_DappsModel) then) =
      __$$_DappsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "url_logo") String urlLogo});
}

/// @nodoc
class __$$_DappsModelCopyWithImpl<$Res>
    extends _$DappsModelCopyWithImpl<$Res, _$_DappsModel>
    implements _$$_DappsModelCopyWith<$Res> {
  __$$_DappsModelCopyWithImpl(
      _$_DappsModel _value, $Res Function(_$_DappsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? tokenName = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlLogo = null,
  }) {
    return _then(_$_DappsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlLogo: null == urlLogo
          ? _value.urlLogo
          : urlLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DappsModel implements _DappsModel {
  const _$_DappsModel(
      {required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "color") required this.color,
      @JsonKey(name: "token_name", includeIfNull: true) this.tokenName,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "url_logo") required this.urlLogo});

  factory _$_DappsModel.fromJson(Map<String, dynamic> json) =>
      _$$_DappsModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "color")
  final String color;
  @override
  @JsonKey(name: "token_name", includeIfNull: true)
  final String? tokenName;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "url_logo")
  final String urlLogo;

  @override
  String toString() {
    return 'DappsModel(id: $id, name: $name, color: $color, tokenName: $tokenName, createdAt: $createdAt, updatedAt: $updatedAt, urlLogo: $urlLogo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DappsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.urlLogo, urlLogo) || other.urlLogo == urlLogo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, color, tokenName, createdAt, updatedAt, urlLogo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DappsModelCopyWith<_$_DappsModel> get copyWith =>
      __$$_DappsModelCopyWithImpl<_$_DappsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DappsModelToJson(
      this,
    );
  }
}

abstract class _DappsModel implements DappsModel {
  const factory _DappsModel(
      {required final String id,
      @JsonKey(name: "name")
          required final String name,
      @JsonKey(name: "color")
          required final String color,
      @JsonKey(name: "token_name", includeIfNull: true)
          final String? tokenName,
      @JsonKey(name: "created_at")
          required final String createdAt,
      @JsonKey(name: "updated_at")
          required final String updatedAt,
      @JsonKey(name: "url_logo")
          required final String urlLogo}) = _$_DappsModel;

  factory _DappsModel.fromJson(Map<String, dynamic> json) =
      _$_DappsModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "color")
  String get color;
  @override
  @JsonKey(name: "token_name", includeIfNull: true)
  String? get tokenName;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "url_logo")
  String get urlLogo;
  @override
  @JsonKey(ignore: true)
  _$$_DappsModelCopyWith<_$_DappsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

NftsModel _$NftsModelFromJson(Map<String, dynamic> json) {
  return _NftsModel.fromJson(json);
}

/// @nodoc
mixin _$NftsModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: "token_name", includeIfNull: true)
  String? get tokenName => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "url_logo")
  String get urlLogo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NftsModelCopyWith<NftsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftsModelCopyWith<$Res> {
  factory $NftsModelCopyWith(NftsModel value, $Res Function(NftsModel) then) =
      _$NftsModelCopyWithImpl<$Res, NftsModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "url_logo") String urlLogo});
}

/// @nodoc
class _$NftsModelCopyWithImpl<$Res, $Val extends NftsModel>
    implements $NftsModelCopyWith<$Res> {
  _$NftsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? tokenName = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlLogo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlLogo: null == urlLogo
          ? _value.urlLogo
          : urlLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NftsModelCopyWith<$Res> implements $NftsModelCopyWith<$Res> {
  factory _$$_NftsModelCopyWith(
          _$_NftsModel value, $Res Function(_$_NftsModel) then) =
      __$$_NftsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "token_name", includeIfNull: true) String? tokenName,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "url_logo") String urlLogo});
}

/// @nodoc
class __$$_NftsModelCopyWithImpl<$Res>
    extends _$NftsModelCopyWithImpl<$Res, _$_NftsModel>
    implements _$$_NftsModelCopyWith<$Res> {
  __$$_NftsModelCopyWithImpl(
      _$_NftsModel _value, $Res Function(_$_NftsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? tokenName = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlLogo = null,
  }) {
    return _then(_$_NftsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlLogo: null == urlLogo
          ? _value.urlLogo
          : urlLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NftsModel implements _NftsModel {
  const _$_NftsModel(
      {required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "color") required this.color,
      @JsonKey(name: "token_name", includeIfNull: true) this.tokenName,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "url_logo") required this.urlLogo});

  factory _$_NftsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NftsModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "color")
  final String color;
  @override
  @JsonKey(name: "token_name", includeIfNull: true)
  final String? tokenName;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "url_logo")
  final String urlLogo;

  @override
  String toString() {
    return 'NftsModel(id: $id, name: $name, color: $color, tokenName: $tokenName, createdAt: $createdAt, updatedAt: $updatedAt, urlLogo: $urlLogo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NftsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.urlLogo, urlLogo) || other.urlLogo == urlLogo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, color, tokenName, createdAt, updatedAt, urlLogo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NftsModelCopyWith<_$_NftsModel> get copyWith =>
      __$$_NftsModelCopyWithImpl<_$_NftsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NftsModelToJson(
      this,
    );
  }
}

abstract class _NftsModel implements NftsModel {
  const factory _NftsModel(
      {required final String id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "color") required final String color,
      @JsonKey(name: "token_name", includeIfNull: true) final String? tokenName,
      @JsonKey(name: "created_at") required final String createdAt,
      @JsonKey(name: "updated_at") required final String updatedAt,
      @JsonKey(name: "url_logo") required final String urlLogo}) = _$_NftsModel;

  factory _NftsModel.fromJson(Map<String, dynamic> json) =
      _$_NftsModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "color")
  String get color;
  @override
  @JsonKey(name: "token_name", includeIfNull: true)
  String? get tokenName;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "url_logo")
  String get urlLogo;
  @override
  @JsonKey(ignore: true)
  _$$_NftsModelCopyWith<_$_NftsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

EventsModel _$EventsModelFromJson(Map<String, dynamic> json) {
  return _EventsModel.fromJson(json);
}

/// @nodoc
mixin _$EventsModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "entities", includeIfNull: true)
  Map<String, dynamic>? get entities => throw _privateConstructorUsedError;
  @JsonKey(name: "scheduled_for")
  String get scheduledFor =>
      throw _privateConstructorUsedError; // @JsonKey(name: "color") required String color,
  @JsonKey(name: "content")
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: "viewed", includeIfNull: false)
  bool get viewed => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "url_image")
  String get urlImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventsModelCopyWith<EventsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsModelCopyWith<$Res> {
  factory $EventsModelCopyWith(
          EventsModel value, $Res Function(EventsModel) then) =
      _$EventsModelCopyWithImpl<$Res, EventsModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "title")
          String title,
      @JsonKey(name: "entities", includeIfNull: true)
          Map<String, dynamic>? entities,
      @JsonKey(name: "scheduled_for")
          String scheduledFor,
      @JsonKey(name: "content")
          String content,
      @JsonKey(name: "viewed", includeIfNull: false)
          bool viewed,
      @JsonKey(name: "created_at")
          String createdAt,
      @JsonKey(name: "updated_at")
          String updatedAt,
      @JsonKey(name: "url_image")
          String urlImage});
}

/// @nodoc
class _$EventsModelCopyWithImpl<$Res, $Val extends EventsModel>
    implements $EventsModelCopyWith<$Res> {
  _$EventsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? entities = freezed,
    Object? scheduledFor = null,
    Object? content = null,
    Object? viewed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      entities: freezed == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      scheduledFor: null == scheduledFor
          ? _value.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventsModelCopyWith<$Res>
    implements $EventsModelCopyWith<$Res> {
  factory _$$_EventsModelCopyWith(
          _$_EventsModel value, $Res Function(_$_EventsModel) then) =
      __$$_EventsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "title")
          String title,
      @JsonKey(name: "entities", includeIfNull: true)
          Map<String, dynamic>? entities,
      @JsonKey(name: "scheduled_for")
          String scheduledFor,
      @JsonKey(name: "content")
          String content,
      @JsonKey(name: "viewed", includeIfNull: false)
          bool viewed,
      @JsonKey(name: "created_at")
          String createdAt,
      @JsonKey(name: "updated_at")
          String updatedAt,
      @JsonKey(name: "url_image")
          String urlImage});
}

/// @nodoc
class __$$_EventsModelCopyWithImpl<$Res>
    extends _$EventsModelCopyWithImpl<$Res, _$_EventsModel>
    implements _$$_EventsModelCopyWith<$Res> {
  __$$_EventsModelCopyWithImpl(
      _$_EventsModel _value, $Res Function(_$_EventsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? entities = freezed,
    Object? scheduledFor = null,
    Object? content = null,
    Object? viewed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlImage = null,
  }) {
    return _then(_$_EventsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      entities: freezed == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      scheduledFor: null == scheduledFor
          ? _value.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventsModel implements _EventsModel {
  const _$_EventsModel(
      {required this.id,
      @JsonKey(name: "title")
          required this.title,
      @JsonKey(name: "entities", includeIfNull: true)
          final Map<String, dynamic>? entities,
      @JsonKey(name: "scheduled_for")
          required this.scheduledFor,
      @JsonKey(name: "content")
          required this.content,
      @JsonKey(name: "viewed", includeIfNull: false)
          required this.viewed,
      @JsonKey(name: "created_at")
          required this.createdAt,
      @JsonKey(name: "updated_at")
          required this.updatedAt,
      @JsonKey(name: "url_image")
          required this.urlImage})
      : _entities = entities;

  factory _$_EventsModel.fromJson(Map<String, dynamic> json) =>
      _$$_EventsModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  final Map<String, dynamic>? _entities;
  @override
  @JsonKey(name: "entities", includeIfNull: true)
  Map<String, dynamic>? get entities {
    final value = _entities;
    if (value == null) return null;
    if (_entities is EqualUnmodifiableMapView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: "scheduled_for")
  final String scheduledFor;
// @JsonKey(name: "color") required String color,
  @override
  @JsonKey(name: "content")
  final String content;
  @override
  @JsonKey(name: "viewed", includeIfNull: false)
  final bool viewed;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "url_image")
  final String urlImage;

  @override
  String toString() {
    return 'EventsModel(id: $id, title: $title, entities: $entities, scheduledFor: $scheduledFor, content: $content, viewed: $viewed, createdAt: $createdAt, updatedAt: $updatedAt, urlImage: $urlImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._entities, _entities) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.urlImage, urlImage) ||
                other.urlImage == urlImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_entities),
      scheduledFor,
      content,
      viewed,
      createdAt,
      updatedAt,
      urlImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventsModelCopyWith<_$_EventsModel> get copyWith =>
      __$$_EventsModelCopyWithImpl<_$_EventsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventsModelToJson(
      this,
    );
  }
}

abstract class _EventsModel implements EventsModel {
  const factory _EventsModel(
      {required final String id,
      @JsonKey(name: "title")
          required final String title,
      @JsonKey(name: "entities", includeIfNull: true)
          final Map<String, dynamic>? entities,
      @JsonKey(name: "scheduled_for")
          required final String scheduledFor,
      @JsonKey(name: "content")
          required final String content,
      @JsonKey(name: "viewed", includeIfNull: false)
          required final bool viewed,
      @JsonKey(name: "created_at")
          required final String createdAt,
      @JsonKey(name: "updated_at")
          required final String updatedAt,
      @JsonKey(name: "url_image")
          required final String urlImage}) = _$_EventsModel;

  factory _EventsModel.fromJson(Map<String, dynamic> json) =
      _$_EventsModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "entities", includeIfNull: true)
  Map<String, dynamic>? get entities;
  @override
  @JsonKey(name: "scheduled_for")
  String get scheduledFor;
  @override // @JsonKey(name: "color") required String color,
  @JsonKey(name: "content")
  String get content;
  @override
  @JsonKey(name: "viewed", includeIfNull: false)
  bool get viewed;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "url_image")
  String get urlImage;
  @override
  @JsonKey(ignore: true)
  _$$_EventsModelCopyWith<_$_EventsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RadarsModel _$RadarsModelFromJson(Map<String, dynamic> json) {
  return _RadarModel.fromJson(json);
}

/// @nodoc
mixin _$RadarsModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  List<dynamic>? get content =>
      throw _privateConstructorUsedError; // @JsonKey(name: "color") required String color,
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "viewed", includeIfNull: false)
  bool get viewed => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "url_image")
  String get urlImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RadarsModelCopyWith<RadarsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadarsModelCopyWith<$Res> {
  factory $RadarsModelCopyWith(
          RadarsModel value, $Res Function(RadarsModel) then) =
      _$RadarsModelCopyWithImpl<$Res, RadarsModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "content") List<dynamic>? content,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "viewed", includeIfNull: false) bool viewed,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "url_image") String urlImage});
}

/// @nodoc
class _$RadarsModelCopyWithImpl<$Res, $Val extends RadarsModel>
    implements $RadarsModelCopyWith<$Res> {
  _$RadarsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = freezed,
    Object? title = null,
    Object? viewed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RadarModelCopyWith<$Res>
    implements $RadarsModelCopyWith<$Res> {
  factory _$$_RadarModelCopyWith(
          _$_RadarModel value, $Res Function(_$_RadarModel) then) =
      __$$_RadarModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "content") List<dynamic>? content,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "viewed", includeIfNull: false) bool viewed,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "url_image") String urlImage});
}

/// @nodoc
class __$$_RadarModelCopyWithImpl<$Res>
    extends _$RadarsModelCopyWithImpl<$Res, _$_RadarModel>
    implements _$$_RadarModelCopyWith<$Res> {
  __$$_RadarModelCopyWithImpl(
      _$_RadarModel _value, $Res Function(_$_RadarModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = freezed,
    Object? title = null,
    Object? viewed = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? urlImage = null,
  }) {
    return _then(_$_RadarModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RadarModel implements _RadarModel {
  const _$_RadarModel(
      {required this.id,
      @JsonKey(name: "content") final List<dynamic>? content,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "viewed", includeIfNull: false) required this.viewed,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "url_image") required this.urlImage})
      : _content = content;

  factory _$_RadarModel.fromJson(Map<String, dynamic> json) =>
      _$$_RadarModelFromJson(json);

  @override
  final String id;
  final List<dynamic>? _content;
  @override
  @JsonKey(name: "content")
  List<dynamic>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// @JsonKey(name: "color") required String color,
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "viewed", includeIfNull: false)
  final bool viewed;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "url_image")
  final String urlImage;

  @override
  String toString() {
    return 'RadarsModel(id: $id, content: $content, title: $title, viewed: $viewed, createdAt: $createdAt, updatedAt: $updatedAt, urlImage: $urlImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RadarModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.urlImage, urlImage) ||
                other.urlImage == urlImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_content),
      title,
      viewed,
      createdAt,
      updatedAt,
      urlImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RadarModelCopyWith<_$_RadarModel> get copyWith =>
      __$$_RadarModelCopyWithImpl<_$_RadarModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RadarModelToJson(
      this,
    );
  }
}

abstract class _RadarModel implements RadarsModel {
  const factory _RadarModel(
      {required final String id,
      @JsonKey(name: "content")
          final List<dynamic>? content,
      @JsonKey(name: "title")
          required final String title,
      @JsonKey(name: "viewed", includeIfNull: false)
          required final bool viewed,
      @JsonKey(name: "created_at")
          required final String createdAt,
      @JsonKey(name: "updated_at")
          required final String updatedAt,
      @JsonKey(name: "url_image")
          required final String urlImage}) = _$_RadarModel;

  factory _RadarModel.fromJson(Map<String, dynamic> json) =
      _$_RadarModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "content")
  List<dynamic>? get content;
  @override // @JsonKey(name: "color") required String color,
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "viewed", includeIfNull: false)
  bool get viewed;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "url_image")
  String get urlImage;
  @override
  @JsonKey(ignore: true)
  _$$_RadarModelCopyWith<_$_RadarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TweetsModel _$TweetsModelFromJson(Map<String, dynamic> json) {
  return _TweetsModel.fromJson(json);
}

/// @nodoc
mixin _$TweetsModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "author")
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: "url_icon")
  String get urlIcon => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "posted_at")
  String get postedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetsModelCopyWith<TweetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetsModelCopyWith<$Res> {
  factory $TweetsModelCopyWith(
          TweetsModel value, $Res Function(TweetsModel) then) =
      _$TweetsModelCopyWithImpl<$Res, TweetsModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "author") String author,
      @JsonKey(name: "url_icon") String urlIcon,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "posted_at") String postedAt});
}

/// @nodoc
class _$TweetsModelCopyWithImpl<$Res, $Val extends TweetsModel>
    implements $TweetsModelCopyWith<$Res> {
  _$TweetsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? urlIcon = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? postedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      urlIcon: null == urlIcon
          ? _value.urlIcon
          : urlIcon // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      postedAt: null == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TweetsModelCopyWith<$Res>
    implements $TweetsModelCopyWith<$Res> {
  factory _$$_TweetsModelCopyWith(
          _$_TweetsModel value, $Res Function(_$_TweetsModel) then) =
      __$$_TweetsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "author") String author,
      @JsonKey(name: "url_icon") String urlIcon,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "posted_at") String postedAt});
}

/// @nodoc
class __$$_TweetsModelCopyWithImpl<$Res>
    extends _$TweetsModelCopyWithImpl<$Res, _$_TweetsModel>
    implements _$$_TweetsModelCopyWith<$Res> {
  __$$_TweetsModelCopyWithImpl(
      _$_TweetsModel _value, $Res Function(_$_TweetsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? urlIcon = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? postedAt = null,
  }) {
    return _then(_$_TweetsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      urlIcon: null == urlIcon
          ? _value.urlIcon
          : urlIcon // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      postedAt: null == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TweetsModel implements _TweetsModel {
  const _$_TweetsModel(
      {required this.id,
      @JsonKey(name: "author") required this.author,
      @JsonKey(name: "url_icon") required this.urlIcon,
      @JsonKey(name: "content") required this.content,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "posted_at") required this.postedAt});

  factory _$_TweetsModel.fromJson(Map<String, dynamic> json) =>
      _$$_TweetsModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "author")
  final String author;
  @override
  @JsonKey(name: "url_icon")
  final String urlIcon;
  @override
  @JsonKey(name: "content")
  final String content;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "posted_at")
  final String postedAt;

  @override
  String toString() {
    return 'TweetsModel(id: $id, author: $author, urlIcon: $urlIcon, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, postedAt: $postedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TweetsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.urlIcon, urlIcon) || other.urlIcon == urlIcon) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.postedAt, postedAt) ||
                other.postedAt == postedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, author, urlIcon, content,
      createdAt, updatedAt, postedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TweetsModelCopyWith<_$_TweetsModel> get copyWith =>
      __$$_TweetsModelCopyWithImpl<_$_TweetsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetsModelToJson(
      this,
    );
  }
}

abstract class _TweetsModel implements TweetsModel {
  const factory _TweetsModel(
          {required final String id,
          @JsonKey(name: "author") required final String author,
          @JsonKey(name: "url_icon") required final String urlIcon,
          @JsonKey(name: "content") required final String content,
          @JsonKey(name: "created_at") required final String createdAt,
          @JsonKey(name: "updated_at") required final String updatedAt,
          @JsonKey(name: "posted_at") required final String postedAt}) =
      _$_TweetsModel;

  factory _TweetsModel.fromJson(Map<String, dynamic> json) =
      _$_TweetsModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "author")
  String get author;
  @override
  @JsonKey(name: "url_icon")
  String get urlIcon;
  @override
  @JsonKey(name: "content")
  String get content;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "posted_at")
  String get postedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TweetsModelCopyWith<_$_TweetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionsModel _$ActionsModelFromJson(Map<String, dynamic> json) {
  return _ActionsModel.fromJson(json);
}

/// @nodoc
mixin _$ActionsModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "author")
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: "url_icon")
  String get urlIcon => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionsModelCopyWith<ActionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionsModelCopyWith<$Res> {
  factory $ActionsModelCopyWith(
          ActionsModel value, $Res Function(ActionsModel) then) =
      _$ActionsModelCopyWithImpl<$Res, ActionsModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "author") String author,
      @JsonKey(name: "url_icon") String urlIcon,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class _$ActionsModelCopyWithImpl<$Res, $Val extends ActionsModel>
    implements $ActionsModelCopyWith<$Res> {
  _$ActionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? urlIcon = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      urlIcon: null == urlIcon
          ? _value.urlIcon
          : urlIcon // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActionsModelCopyWith<$Res>
    implements $ActionsModelCopyWith<$Res> {
  factory _$$_ActionsModelCopyWith(
          _$_ActionsModel value, $Res Function(_$_ActionsModel) then) =
      __$$_ActionsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "author") String author,
      @JsonKey(name: "url_icon") String urlIcon,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class __$$_ActionsModelCopyWithImpl<$Res>
    extends _$ActionsModelCopyWithImpl<$Res, _$_ActionsModel>
    implements _$$_ActionsModelCopyWith<$Res> {
  __$$_ActionsModelCopyWithImpl(
      _$_ActionsModel _value, $Res Function(_$_ActionsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? urlIcon = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_ActionsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      urlIcon: null == urlIcon
          ? _value.urlIcon
          : urlIcon // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActionsModel implements _ActionsModel {
  const _$_ActionsModel(
      {required this.id,
      @JsonKey(name: "author") required this.author,
      @JsonKey(name: "url_icon") required this.urlIcon,
      @JsonKey(name: "content") required this.content,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt});

  factory _$_ActionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ActionsModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "author")
  final String author;
  @override
  @JsonKey(name: "url_icon")
  final String urlIcon;
  @override
  @JsonKey(name: "content")
  final String content;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;

  @override
  String toString() {
    return 'ActionsModel(id: $id, author: $author, urlIcon: $urlIcon, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActionsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.urlIcon, urlIcon) || other.urlIcon == urlIcon) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, author, urlIcon, content, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActionsModelCopyWith<_$_ActionsModel> get copyWith =>
      __$$_ActionsModelCopyWithImpl<_$_ActionsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActionsModelToJson(
      this,
    );
  }
}

abstract class _ActionsModel implements ActionsModel {
  const factory _ActionsModel(
          {required final String id,
          @JsonKey(name: "author") required final String author,
          @JsonKey(name: "url_icon") required final String urlIcon,
          @JsonKey(name: "content") required final String content,
          @JsonKey(name: "created_at") required final String createdAt,
          @JsonKey(name: "updated_at") required final String updatedAt}) =
      _$_ActionsModel;

  factory _ActionsModel.fromJson(Map<String, dynamic> json) =
      _$_ActionsModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "author")
  String get author;
  @override
  @JsonKey(name: "url_icon")
  String get urlIcon;
  @override
  @JsonKey(name: "content")
  String get content;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ActionsModelCopyWith<_$_ActionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CronModel _$CronModelFromJson(Map<String, dynamic> json) {
  return _CronModel.fromJson(json);
}

/// @nodoc
mixin _$CronModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "table_name")
  String get tableName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_updated")
  String get lastUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CronModelCopyWith<CronModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CronModelCopyWith<$Res> {
  factory $CronModelCopyWith(CronModel value, $Res Function(CronModel) then) =
      _$CronModelCopyWithImpl<$Res, CronModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "table_name") String tableName,
      @JsonKey(name: "last_updated") String lastUpdated,
      @JsonKey(name: "created_at") String createdAt});
}

/// @nodoc
class _$CronModelCopyWithImpl<$Res, $Val extends CronModel>
    implements $CronModelCopyWith<$Res> {
  _$CronModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableName = null,
    Object? lastUpdated = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CronModelCopyWith<$Res> implements $CronModelCopyWith<$Res> {
  factory _$$_CronModelCopyWith(
          _$_CronModel value, $Res Function(_$_CronModel) then) =
      __$$_CronModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "table_name") String tableName,
      @JsonKey(name: "last_updated") String lastUpdated,
      @JsonKey(name: "created_at") String createdAt});
}

/// @nodoc
class __$$_CronModelCopyWithImpl<$Res>
    extends _$CronModelCopyWithImpl<$Res, _$_CronModel>
    implements _$$_CronModelCopyWith<$Res> {
  __$$_CronModelCopyWithImpl(
      _$_CronModel _value, $Res Function(_$_CronModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableName = null,
    Object? lastUpdated = null,
    Object? createdAt = null,
  }) {
    return _then(_$_CronModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CronModel implements _CronModel {
  const _$_CronModel(
      {required this.id,
      @JsonKey(name: "table_name") required this.tableName,
      @JsonKey(name: "last_updated") required this.lastUpdated,
      @JsonKey(name: "created_at") required this.createdAt});

  factory _$_CronModel.fromJson(Map<String, dynamic> json) =>
      _$$_CronModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "table_name")
  final String tableName;
  @override
  @JsonKey(name: "last_updated")
  final String lastUpdated;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;

  @override
  String toString() {
    return 'CronModel(id: $id, tableName: $tableName, lastUpdated: $lastUpdated, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CronModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, tableName, lastUpdated, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CronModelCopyWith<_$_CronModel> get copyWith =>
      __$$_CronModelCopyWithImpl<_$_CronModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CronModelToJson(
      this,
    );
  }
}

abstract class _CronModel implements CronModel {
  const factory _CronModel(
          {required final String id,
          @JsonKey(name: "table_name") required final String tableName,
          @JsonKey(name: "last_updated") required final String lastUpdated,
          @JsonKey(name: "created_at") required final String createdAt}) =
      _$_CronModel;

  factory _CronModel.fromJson(Map<String, dynamic> json) =
      _$_CronModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "table_name")
  String get tableName;
  @override
  @JsonKey(name: "last_updated")
  String get lastUpdated;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CronModelCopyWith<_$_CronModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrencyPillModel _$CurrencyPillModelFromJson(Map<String, dynamic> json) {
  return _CurrencyPillModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyPillModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "icon")
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: "symbol")
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: "is_price_up")
  bool get isPriceUp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyPillModelCopyWith<CurrencyPillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyPillModelCopyWith<$Res> {
  factory $CurrencyPillModelCopyWith(
          CurrencyPillModel value, $Res Function(CurrencyPillModel) then) =
      _$CurrencyPillModelCopyWithImpl<$Res, CurrencyPillModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "icon") String icon,
      @JsonKey(name: "price") String price,
      @JsonKey(name: "symbol") String symbol,
      @JsonKey(name: "is_price_up") bool isPriceUp});
}

/// @nodoc
class _$CurrencyPillModelCopyWithImpl<$Res, $Val extends CurrencyPillModel>
    implements $CurrencyPillModelCopyWith<$Res> {
  _$CurrencyPillModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? price = null,
    Object? symbol = null,
    Object? isPriceUp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      isPriceUp: null == isPriceUp
          ? _value.isPriceUp
          : isPriceUp // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyPillModelCopyWith<$Res>
    implements $CurrencyPillModelCopyWith<$Res> {
  factory _$$_CurrencyPillModelCopyWith(_$_CurrencyPillModel value,
          $Res Function(_$_CurrencyPillModel) then) =
      __$$_CurrencyPillModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "icon") String icon,
      @JsonKey(name: "price") String price,
      @JsonKey(name: "symbol") String symbol,
      @JsonKey(name: "is_price_up") bool isPriceUp});
}

/// @nodoc
class __$$_CurrencyPillModelCopyWithImpl<$Res>
    extends _$CurrencyPillModelCopyWithImpl<$Res, _$_CurrencyPillModel>
    implements _$$_CurrencyPillModelCopyWith<$Res> {
  __$$_CurrencyPillModelCopyWithImpl(
      _$_CurrencyPillModel _value, $Res Function(_$_CurrencyPillModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? price = null,
    Object? symbol = null,
    Object? isPriceUp = null,
  }) {
    return _then(_$_CurrencyPillModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      isPriceUp: null == isPriceUp
          ? _value.isPriceUp
          : isPriceUp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyPillModel implements _CurrencyPillModel {
  const _$_CurrencyPillModel(
      {required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "icon") required this.icon,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "symbol") required this.symbol,
      @JsonKey(name: "is_price_up") required this.isPriceUp});

  factory _$_CurrencyPillModel.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyPillModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "icon")
  final String icon;
  @override
  @JsonKey(name: "price")
  final String price;
  @override
  @JsonKey(name: "symbol")
  final String symbol;
  @override
  @JsonKey(name: "is_price_up")
  final bool isPriceUp;

  @override
  String toString() {
    return 'CurrencyPillModel(id: $id, name: $name, icon: $icon, price: $price, symbol: $symbol, isPriceUp: $isPriceUp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyPillModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.isPriceUp, isPriceUp) ||
                other.isPriceUp == isPriceUp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, icon, price, symbol, isPriceUp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyPillModelCopyWith<_$_CurrencyPillModel> get copyWith =>
      __$$_CurrencyPillModelCopyWithImpl<_$_CurrencyPillModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyPillModelToJson(
      this,
    );
  }
}

abstract class _CurrencyPillModel implements CurrencyPillModel {
  const factory _CurrencyPillModel(
          {required final String id,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "icon") required final String icon,
          @JsonKey(name: "price") required final String price,
          @JsonKey(name: "symbol") required final String symbol,
          @JsonKey(name: "is_price_up") required final bool isPriceUp}) =
      _$_CurrencyPillModel;

  factory _CurrencyPillModel.fromJson(Map<String, dynamic> json) =
      _$_CurrencyPillModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "icon")
  String get icon;
  @override
  @JsonKey(name: "price")
  String get price;
  @override
  @JsonKey(name: "symbol")
  String get symbol;
  @override
  @JsonKey(name: "is_price_up")
  bool get isPriceUp;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyPillModelCopyWith<_$_CurrencyPillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) {
  return _UsersModel.fromJson(json);
}

/// @nodoc
mixin _$UsersModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "discord_id")
  String get discordId => throw _privateConstructorUsedError;
  @JsonKey(name: "discord_name")
  String get discordName => throw _privateConstructorUsedError;
  @JsonKey(name: "discord_role")
  String get discordRole => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "instagram_validation")
  String get instagramValidation => throw _privateConstructorUsedError;
  @JsonKey(name: "instagram_validated")
  bool get instagramValidated => throw _privateConstructorUsedError;
  @JsonKey(name: "setup_complete")
  bool get setupComplete => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar_url")
  String get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersModelCopyWith<UsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersModelCopyWith<$Res> {
  factory $UsersModelCopyWith(
          UsersModel value, $Res Function(UsersModel) then) =
      _$UsersModelCopyWithImpl<$Res, UsersModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "discord_id") String discordId,
      @JsonKey(name: "discord_name") String discordName,
      @JsonKey(name: "discord_role") String discordRole,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "instagram_validation") String instagramValidation,
      @JsonKey(name: "instagram_validated") bool instagramValidated,
      @JsonKey(name: "setup_complete") bool setupComplete,
      @JsonKey(name: "avatar_url") String avatarUrl});
}

/// @nodoc
class _$UsersModelCopyWithImpl<$Res, $Val extends UsersModel>
    implements $UsersModelCopyWith<$Res> {
  _$UsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? discordId = null,
    Object? discordName = null,
    Object? discordRole = null,
    Object? email = null,
    Object? instagramValidation = null,
    Object? instagramValidated = null,
    Object? setupComplete = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      discordId: null == discordId
          ? _value.discordId
          : discordId // ignore: cast_nullable_to_non_nullable
              as String,
      discordName: null == discordName
          ? _value.discordName
          : discordName // ignore: cast_nullable_to_non_nullable
              as String,
      discordRole: null == discordRole
          ? _value.discordRole
          : discordRole // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      instagramValidation: null == instagramValidation
          ? _value.instagramValidation
          : instagramValidation // ignore: cast_nullable_to_non_nullable
              as String,
      instagramValidated: null == instagramValidated
          ? _value.instagramValidated
          : instagramValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      setupComplete: null == setupComplete
          ? _value.setupComplete
          : setupComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersModelCopyWith<$Res>
    implements $UsersModelCopyWith<$Res> {
  factory _$$_UsersModelCopyWith(
          _$_UsersModel value, $Res Function(_$_UsersModel) then) =
      __$$_UsersModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "discord_id") String discordId,
      @JsonKey(name: "discord_name") String discordName,
      @JsonKey(name: "discord_role") String discordRole,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "instagram_validation") String instagramValidation,
      @JsonKey(name: "instagram_validated") bool instagramValidated,
      @JsonKey(name: "setup_complete") bool setupComplete,
      @JsonKey(name: "avatar_url") String avatarUrl});
}

/// @nodoc
class __$$_UsersModelCopyWithImpl<$Res>
    extends _$UsersModelCopyWithImpl<$Res, _$_UsersModel>
    implements _$$_UsersModelCopyWith<$Res> {
  __$$_UsersModelCopyWithImpl(
      _$_UsersModel _value, $Res Function(_$_UsersModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? discordId = null,
    Object? discordName = null,
    Object? discordRole = null,
    Object? email = null,
    Object? instagramValidation = null,
    Object? instagramValidated = null,
    Object? setupComplete = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$_UsersModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      discordId: null == discordId
          ? _value.discordId
          : discordId // ignore: cast_nullable_to_non_nullable
              as String,
      discordName: null == discordName
          ? _value.discordName
          : discordName // ignore: cast_nullable_to_non_nullable
              as String,
      discordRole: null == discordRole
          ? _value.discordRole
          : discordRole // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      instagramValidation: null == instagramValidation
          ? _value.instagramValidation
          : instagramValidation // ignore: cast_nullable_to_non_nullable
              as String,
      instagramValidated: null == instagramValidated
          ? _value.instagramValidated
          : instagramValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      setupComplete: null == setupComplete
          ? _value.setupComplete
          : setupComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersModel implements _UsersModel {
  const _$_UsersModel(
      {required this.id,
      @JsonKey(name: "discord_id") required this.discordId,
      @JsonKey(name: "discord_name") required this.discordName,
      @JsonKey(name: "discord_role") required this.discordRole,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "instagram_validation") required this.instagramValidation,
      @JsonKey(name: "instagram_validated") required this.instagramValidated,
      @JsonKey(name: "setup_complete") required this.setupComplete,
      @JsonKey(name: "avatar_url") required this.avatarUrl});

  factory _$_UsersModel.fromJson(Map<String, dynamic> json) =>
      _$$_UsersModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "discord_id")
  final String discordId;
  @override
  @JsonKey(name: "discord_name")
  final String discordName;
  @override
  @JsonKey(name: "discord_role")
  final String discordRole;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "instagram_validation")
  final String instagramValidation;
  @override
  @JsonKey(name: "instagram_validated")
  final bool instagramValidated;
  @override
  @JsonKey(name: "setup_complete")
  final bool setupComplete;
  @override
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  @override
  String toString() {
    return 'UsersModel(id: $id, discordId: $discordId, discordName: $discordName, discordRole: $discordRole, email: $email, instagramValidation: $instagramValidation, instagramValidated: $instagramValidated, setupComplete: $setupComplete, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.discordId, discordId) ||
                other.discordId == discordId) &&
            (identical(other.discordName, discordName) ||
                other.discordName == discordName) &&
            (identical(other.discordRole, discordRole) ||
                other.discordRole == discordRole) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.instagramValidation, instagramValidation) ||
                other.instagramValidation == instagramValidation) &&
            (identical(other.instagramValidated, instagramValidated) ||
                other.instagramValidated == instagramValidated) &&
            (identical(other.setupComplete, setupComplete) ||
                other.setupComplete == setupComplete) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      discordId,
      discordName,
      discordRole,
      email,
      instagramValidation,
      instagramValidated,
      setupComplete,
      avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersModelCopyWith<_$_UsersModel> get copyWith =>
      __$$_UsersModelCopyWithImpl<_$_UsersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersModelToJson(
      this,
    );
  }
}

abstract class _UsersModel implements UsersModel {
  const factory _UsersModel(
      {required final String id,
      @JsonKey(name: "discord_id")
          required final String discordId,
      @JsonKey(name: "discord_name")
          required final String discordName,
      @JsonKey(name: "discord_role")
          required final String discordRole,
      @JsonKey(name: "email")
          required final String email,
      @JsonKey(name: "instagram_validation")
          required final String instagramValidation,
      @JsonKey(name: "instagram_validated")
          required final bool instagramValidated,
      @JsonKey(name: "setup_complete")
          required final bool setupComplete,
      @JsonKey(name: "avatar_url")
          required final String avatarUrl}) = _$_UsersModel;

  factory _UsersModel.fromJson(Map<String, dynamic> json) =
      _$_UsersModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "discord_id")
  String get discordId;
  @override
  @JsonKey(name: "discord_name")
  String get discordName;
  @override
  @JsonKey(name: "discord_role")
  String get discordRole;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "instagram_validation")
  String get instagramValidation;
  @override
  @JsonKey(name: "instagram_validated")
  bool get instagramValidated;
  @override
  @JsonKey(name: "setup_complete")
  bool get setupComplete;
  @override
  @JsonKey(name: "avatar_url")
  String get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$$_UsersModelCopyWith<_$_UsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}
