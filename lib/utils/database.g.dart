// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NewsTableTable extends NewsTable with TableInfo<$NewsTableTable, News> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlImageMeta =
      const VerificationMeta('urlImage');
  @override
  late final GeneratedColumn<String> urlImage = GeneratedColumn<String>(
      'url_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _viewedMeta = const VerificationMeta('viewed');
  @override
  late final GeneratedColumn<bool> viewed =
      GeneratedColumn<bool>('viewed', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("viewed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlSourceMeta =
      const VerificationMeta('urlSource');
  @override
  late final GeneratedColumn<String> urlSource = GeneratedColumn<String>(
      'url_source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _commentsMeta =
      const VerificationMeta('comments');
  @override
  late final GeneratedColumn<String> comments = GeneratedColumn<String>(
      'comments', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _commentsCountMeta =
      const VerificationMeta('commentsCount');
  @override
  late final GeneratedColumn<int> commentsCount = GeneratedColumn<int>(
      'comments_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _discordThreadMeta =
      const VerificationMeta('discordThread');
  @override
  late final GeneratedColumn<String> discordThread = GeneratedColumn<String>(
      'discord_thread', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<String> publishedAt = GeneratedColumn<String>(
      'published_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        urlImage,
        title,
        viewed,
        projectId,
        urlSource,
        createdAt,
        updatedAt,
        comments,
        commentsCount,
        discordThread,
        publishedAt
      ];
  @override
  String get aliasedName => _alias ?? 'news_table';
  @override
  String get actualTableName => 'news_table';
  @override
  VerificationContext validateIntegrity(Insertable<News> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url_image')) {
      context.handle(_urlImageMeta,
          urlImage.isAcceptableOrUnknown(data['url_image']!, _urlImageMeta));
    } else if (isInserting) {
      context.missing(_urlImageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('viewed')) {
      context.handle(_viewedMeta,
          viewed.isAcceptableOrUnknown(data['viewed']!, _viewedMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('url_source')) {
      context.handle(_urlSourceMeta,
          urlSource.isAcceptableOrUnknown(data['url_source']!, _urlSourceMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('comments')) {
      context.handle(_commentsMeta,
          comments.isAcceptableOrUnknown(data['comments']!, _commentsMeta));
    }
    if (data.containsKey('comments_count')) {
      context.handle(
          _commentsCountMeta,
          commentsCount.isAcceptableOrUnknown(
              data['comments_count']!, _commentsCountMeta));
    }
    if (data.containsKey('discord_thread')) {
      context.handle(
          _discordThreadMeta,
          discordThread.isAcceptableOrUnknown(
              data['discord_thread']!, _discordThreadMeta));
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  News map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return News(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      urlImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_image'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      viewed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}viewed']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      urlSource: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_source']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      comments: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comments']),
      commentsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}comments_count']),
      discordThread: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discord_thread']),
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}published_at']),
    );
  }

  @override
  $NewsTableTable createAlias(String alias) {
    return $NewsTableTable(attachedDatabase, alias);
  }
}

class News extends DataClass implements Insertable<News> {
  final String id;
  final String urlImage;
  final String title;
  final bool? viewed;
  final String? projectId;
  final String? urlSource;
  final String createdAt;
  final String updatedAt;
  final String? comments;
  final int? commentsCount;
  final String? discordThread;
  final String? publishedAt;
  const News(
      {required this.id,
      required this.urlImage,
      required this.title,
      this.viewed,
      this.projectId,
      this.urlSource,
      required this.createdAt,
      required this.updatedAt,
      this.comments,
      this.commentsCount,
      this.discordThread,
      this.publishedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['url_image'] = Variable<String>(urlImage);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || viewed != null) {
      map['viewed'] = Variable<bool>(viewed);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || urlSource != null) {
      map['url_source'] = Variable<String>(urlSource);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    if (!nullToAbsent || comments != null) {
      map['comments'] = Variable<String>(comments);
    }
    if (!nullToAbsent || commentsCount != null) {
      map['comments_count'] = Variable<int>(commentsCount);
    }
    if (!nullToAbsent || discordThread != null) {
      map['discord_thread'] = Variable<String>(discordThread);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<String>(publishedAt);
    }
    return map;
  }

  NewsTableCompanion toCompanion(bool nullToAbsent) {
    return NewsTableCompanion(
      id: Value(id),
      urlImage: Value(urlImage),
      title: Value(title),
      viewed:
          viewed == null && nullToAbsent ? const Value.absent() : Value(viewed),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      urlSource: urlSource == null && nullToAbsent
          ? const Value.absent()
          : Value(urlSource),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      comments: comments == null && nullToAbsent
          ? const Value.absent()
          : Value(comments),
      commentsCount: commentsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(commentsCount),
      discordThread: discordThread == null && nullToAbsent
          ? const Value.absent()
          : Value(discordThread),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
    );
  }

  factory News.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return News(
      id: serializer.fromJson<String>(json['id']),
      urlImage: serializer.fromJson<String>(json['url_image']),
      title: serializer.fromJson<String>(json['title']),
      viewed: serializer.fromJson<bool?>(json['viewed']),
      projectId: serializer.fromJson<String?>(json['project_id']),
      urlSource: serializer.fromJson<String?>(json['url_source']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
      comments: serializer.fromJson<String?>(json['comments']),
      commentsCount: serializer.fromJson<int?>(json['comments_count']),
      discordThread: serializer.fromJson<String?>(json['discord_thread']),
      publishedAt: serializer.fromJson<String?>(json['published_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'url_image': serializer.toJson<String>(urlImage),
      'title': serializer.toJson<String>(title),
      'viewed': serializer.toJson<bool?>(viewed),
      'project_id': serializer.toJson<String?>(projectId),
      'url_source': serializer.toJson<String?>(urlSource),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
      'comments': serializer.toJson<String?>(comments),
      'comments_count': serializer.toJson<int?>(commentsCount),
      'discord_thread': serializer.toJson<String?>(discordThread),
      'published_at': serializer.toJson<String?>(publishedAt),
    };
  }

  News copyWith(
          {String? id,
          String? urlImage,
          String? title,
          Value<bool?> viewed = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<String?> urlSource = const Value.absent(),
          String? createdAt,
          String? updatedAt,
          Value<String?> comments = const Value.absent(),
          Value<int?> commentsCount = const Value.absent(),
          Value<String?> discordThread = const Value.absent(),
          Value<String?> publishedAt = const Value.absent()}) =>
      News(
        id: id ?? this.id,
        urlImage: urlImage ?? this.urlImage,
        title: title ?? this.title,
        viewed: viewed.present ? viewed.value : this.viewed,
        projectId: projectId.present ? projectId.value : this.projectId,
        urlSource: urlSource.present ? urlSource.value : this.urlSource,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        comments: comments.present ? comments.value : this.comments,
        commentsCount:
            commentsCount.present ? commentsCount.value : this.commentsCount,
        discordThread:
            discordThread.present ? discordThread.value : this.discordThread,
        publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
      );
  @override
  String toString() {
    return (StringBuffer('News(')
          ..write('id: $id, ')
          ..write('urlImage: $urlImage, ')
          ..write('title: $title, ')
          ..write('viewed: $viewed, ')
          ..write('projectId: $projectId, ')
          ..write('urlSource: $urlSource, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('comments: $comments, ')
          ..write('commentsCount: $commentsCount, ')
          ..write('discordThread: $discordThread, ')
          ..write('publishedAt: $publishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      urlImage,
      title,
      viewed,
      projectId,
      urlSource,
      createdAt,
      updatedAt,
      comments,
      commentsCount,
      discordThread,
      publishedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is News &&
          other.id == this.id &&
          other.urlImage == this.urlImage &&
          other.title == this.title &&
          other.viewed == this.viewed &&
          other.projectId == this.projectId &&
          other.urlSource == this.urlSource &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.comments == this.comments &&
          other.commentsCount == this.commentsCount &&
          other.discordThread == this.discordThread &&
          other.publishedAt == this.publishedAt);
}

class NewsTableCompanion extends UpdateCompanion<News> {
  final Value<String> id;
  final Value<String> urlImage;
  final Value<String> title;
  final Value<bool?> viewed;
  final Value<String?> projectId;
  final Value<String?> urlSource;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String?> comments;
  final Value<int?> commentsCount;
  final Value<String?> discordThread;
  final Value<String?> publishedAt;
  final Value<int> rowid;
  const NewsTableCompanion({
    this.id = const Value.absent(),
    this.urlImage = const Value.absent(),
    this.title = const Value.absent(),
    this.viewed = const Value.absent(),
    this.projectId = const Value.absent(),
    this.urlSource = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.comments = const Value.absent(),
    this.commentsCount = const Value.absent(),
    this.discordThread = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsTableCompanion.insert({
    required String id,
    required String urlImage,
    required String title,
    this.viewed = const Value.absent(),
    this.projectId = const Value.absent(),
    this.urlSource = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.comments = const Value.absent(),
    this.commentsCount = const Value.absent(),
    this.discordThread = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        urlImage = Value(urlImage),
        title = Value(title),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<News> custom({
    Expression<String>? id,
    Expression<String>? urlImage,
    Expression<String>? title,
    Expression<bool>? viewed,
    Expression<String>? projectId,
    Expression<String>? urlSource,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? comments,
    Expression<int>? commentsCount,
    Expression<String>? discordThread,
    Expression<String>? publishedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (urlImage != null) 'url_image': urlImage,
      if (title != null) 'title': title,
      if (viewed != null) 'viewed': viewed,
      if (projectId != null) 'project_id': projectId,
      if (urlSource != null) 'url_source': urlSource,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (comments != null) 'comments': comments,
      if (commentsCount != null) 'comments_count': commentsCount,
      if (discordThread != null) 'discord_thread': discordThread,
      if (publishedAt != null) 'published_at': publishedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? urlImage,
      Value<String>? title,
      Value<bool?>? viewed,
      Value<String?>? projectId,
      Value<String?>? urlSource,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String?>? comments,
      Value<int?>? commentsCount,
      Value<String?>? discordThread,
      Value<String?>? publishedAt,
      Value<int>? rowid}) {
    return NewsTableCompanion(
      id: id ?? this.id,
      urlImage: urlImage ?? this.urlImage,
      title: title ?? this.title,
      viewed: viewed ?? this.viewed,
      projectId: projectId ?? this.projectId,
      urlSource: urlSource ?? this.urlSource,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      comments: comments ?? this.comments,
      commentsCount: commentsCount ?? this.commentsCount,
      discordThread: discordThread ?? this.discordThread,
      publishedAt: publishedAt ?? this.publishedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (urlImage.present) {
      map['url_image'] = Variable<String>(urlImage.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (viewed.present) {
      map['viewed'] = Variable<bool>(viewed.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (urlSource.present) {
      map['url_source'] = Variable<String>(urlSource.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (comments.present) {
      map['comments'] = Variable<String>(comments.value);
    }
    if (commentsCount.present) {
      map['comments_count'] = Variable<int>(commentsCount.value);
    }
    if (discordThread.present) {
      map['discord_thread'] = Variable<String>(discordThread.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableCompanion(')
          ..write('id: $id, ')
          ..write('urlImage: $urlImage, ')
          ..write('title: $title, ')
          ..write('viewed: $viewed, ')
          ..write('projectId: $projectId, ')
          ..write('urlSource: $urlSource, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('comments: $comments, ')
          ..write('commentsCount: $commentsCount, ')
          ..write('discordThread: $discordThread, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTableTable extends ArticlesTable
    with TableInfo<$ArticlesTableTable, Articles> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subtitleMeta =
      const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
      'subtitle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _viewedMeta = const VerificationMeta('viewed');
  @override
  late final GeneratedColumn<bool> viewed =
      GeneratedColumn<bool>('viewed', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("viewed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlImageMeta =
      const VerificationMeta('urlImage');
  @override
  late final GeneratedColumn<String> urlImage = GeneratedColumn<String>(
      'url_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        subtitle,
        link,
        viewed,
        content,
        urlImage,
        entityType,
        entityId,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'articles_table';
  @override
  String get actualTableName => 'articles_table';
  @override
  VerificationContext validateIntegrity(Insertable<Articles> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta));
    } else if (isInserting) {
      context.missing(_subtitleMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('viewed')) {
      context.handle(_viewedMeta,
          viewed.isAcceptableOrUnknown(data['viewed']!, _viewedMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('url_image')) {
      context.handle(_urlImageMeta,
          urlImage.isAcceptableOrUnknown(data['url_image']!, _urlImageMeta));
    } else if (isInserting) {
      context.missing(_urlImageMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Articles map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Articles(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      subtitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtitle'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      viewed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}viewed']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      urlImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_image'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ArticlesTableTable createAlias(String alias) {
    return $ArticlesTableTable(attachedDatabase, alias);
  }
}

class Articles extends DataClass implements Insertable<Articles> {
  final String id;
  final String title;
  final String subtitle;
  final String link;
  final bool? viewed;
  final String content;
  final String urlImage;
  final String entityType;
  final String entityId;
  final String createdAt;
  final String updatedAt;
  const Articles(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.link,
      this.viewed,
      required this.content,
      required this.urlImage,
      required this.entityType,
      required this.entityId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['subtitle'] = Variable<String>(subtitle);
    map['link'] = Variable<String>(link);
    if (!nullToAbsent || viewed != null) {
      map['viewed'] = Variable<bool>(viewed);
    }
    map['content'] = Variable<String>(content);
    map['url_image'] = Variable<String>(urlImage);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  ArticlesTableCompanion toCompanion(bool nullToAbsent) {
    return ArticlesTableCompanion(
      id: Value(id),
      title: Value(title),
      subtitle: Value(subtitle),
      link: Value(link),
      viewed:
          viewed == null && nullToAbsent ? const Value.absent() : Value(viewed),
      content: Value(content),
      urlImage: Value(urlImage),
      entityType: Value(entityType),
      entityId: Value(entityId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Articles.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Articles(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      link: serializer.fromJson<String>(json['link']),
      viewed: serializer.fromJson<bool?>(json['viewed']),
      content: serializer.fromJson<String>(json['content']),
      urlImage: serializer.fromJson<String>(json['url_image']),
      entityType: serializer.fromJson<String>(json['entity_type']),
      entityId: serializer.fromJson<String>(json['entity_id']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String>(subtitle),
      'link': serializer.toJson<String>(link),
      'viewed': serializer.toJson<bool?>(viewed),
      'content': serializer.toJson<String>(content),
      'url_image': serializer.toJson<String>(urlImage),
      'entity_type': serializer.toJson<String>(entityType),
      'entity_id': serializer.toJson<String>(entityId),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  Articles copyWith(
          {String? id,
          String? title,
          String? subtitle,
          String? link,
          Value<bool?> viewed = const Value.absent(),
          String? content,
          String? urlImage,
          String? entityType,
          String? entityId,
          String? createdAt,
          String? updatedAt}) =>
      Articles(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        link: link ?? this.link,
        viewed: viewed.present ? viewed.value : this.viewed,
        content: content ?? this.content,
        urlImage: urlImage ?? this.urlImage,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Articles(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('link: $link, ')
          ..write('viewed: $viewed, ')
          ..write('content: $content, ')
          ..write('urlImage: $urlImage, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, subtitle, link, viewed, content,
      urlImage, entityType, entityId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Articles &&
          other.id == this.id &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.link == this.link &&
          other.viewed == this.viewed &&
          other.content == this.content &&
          other.urlImage == this.urlImage &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ArticlesTableCompanion extends UpdateCompanion<Articles> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> subtitle;
  final Value<String> link;
  final Value<bool?> viewed;
  final Value<String> content;
  final Value<String> urlImage;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const ArticlesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.link = const Value.absent(),
    this.viewed = const Value.absent(),
    this.content = const Value.absent(),
    this.urlImage = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticlesTableCompanion.insert({
    required String id,
    required String title,
    required String subtitle,
    required String link,
    this.viewed = const Value.absent(),
    required String content,
    required String urlImage,
    required String entityType,
    required String entityId,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        subtitle = Value(subtitle),
        link = Value(link),
        content = Value(content),
        urlImage = Value(urlImage),
        entityType = Value(entityType),
        entityId = Value(entityId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Articles> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<String>? link,
    Expression<bool>? viewed,
    Expression<String>? content,
    Expression<String>? urlImage,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (link != null) 'link': link,
      if (viewed != null) 'viewed': viewed,
      if (content != null) 'content': content,
      if (urlImage != null) 'url_image': urlImage,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticlesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? subtitle,
      Value<String>? link,
      Value<bool?>? viewed,
      Value<String>? content,
      Value<String>? urlImage,
      Value<String>? entityType,
      Value<String>? entityId,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return ArticlesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      link: link ?? this.link,
      viewed: viewed ?? this.viewed,
      content: content ?? this.content,
      urlImage: urlImage ?? this.urlImage,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (viewed.present) {
      map['viewed'] = Variable<bool>(viewed.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (urlImage.present) {
      map['url_image'] = Variable<String>(urlImage.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('link: $link, ')
          ..write('viewed: $viewed, ')
          ..write('content: $content, ')
          ..write('urlImage: $urlImage, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTableTable extends EventsTable
    with TableInfo<$EventsTableTable, Events> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entitiesMeta =
      const VerificationMeta('entities');
  @override
  late final GeneratedColumn<String> entities = GeneratedColumn<String>(
      'entities', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _viewedMeta = const VerificationMeta('viewed');
  @override
  late final GeneratedColumn<bool> viewed =
      GeneratedColumn<bool>('viewed', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("viewed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlImageMeta =
      const VerificationMeta('urlImage');
  @override
  late final GeneratedColumn<String> urlImage = GeneratedColumn<String>(
      'url_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduledForMeta =
      const VerificationMeta('scheduledFor');
  @override
  late final GeneratedColumn<String> scheduledFor = GeneratedColumn<String>(
      'scheduled_for', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        entities,
        viewed,
        title,
        content,
        urlImage,
        createdAt,
        updatedAt,
        scheduledFor
      ];
  @override
  String get aliasedName => _alias ?? 'events_table';
  @override
  String get actualTableName => 'events_table';
  @override
  VerificationContext validateIntegrity(Insertable<Events> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entities')) {
      context.handle(_entitiesMeta,
          entities.isAcceptableOrUnknown(data['entities']!, _entitiesMeta));
    }
    if (data.containsKey('viewed')) {
      context.handle(_viewedMeta,
          viewed.isAcceptableOrUnknown(data['viewed']!, _viewedMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('url_image')) {
      context.handle(_urlImageMeta,
          urlImage.isAcceptableOrUnknown(data['url_image']!, _urlImageMeta));
    } else if (isInserting) {
      context.missing(_urlImageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
          _scheduledForMeta,
          scheduledFor.isAcceptableOrUnknown(
              data['scheduled_for']!, _scheduledForMeta));
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Events map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Events(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      entities: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entities']),
      viewed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}viewed']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      urlImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_image'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      scheduledFor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scheduled_for'])!,
    );
  }

  @override
  $EventsTableTable createAlias(String alias) {
    return $EventsTableTable(attachedDatabase, alias);
  }
}

class Events extends DataClass implements Insertable<Events> {
  final String id;
  final String? entities;
  final bool? viewed;
  final String title;
  final String content;
  final String urlImage;
  final String createdAt;
  final String updatedAt;
  final String scheduledFor;
  const Events(
      {required this.id,
      this.entities,
      this.viewed,
      required this.title,
      required this.content,
      required this.urlImage,
      required this.createdAt,
      required this.updatedAt,
      required this.scheduledFor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || entities != null) {
      map['entities'] = Variable<String>(entities);
    }
    if (!nullToAbsent || viewed != null) {
      map['viewed'] = Variable<bool>(viewed);
    }
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['url_image'] = Variable<String>(urlImage);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['scheduled_for'] = Variable<String>(scheduledFor);
    return map;
  }

  EventsTableCompanion toCompanion(bool nullToAbsent) {
    return EventsTableCompanion(
      id: Value(id),
      entities: entities == null && nullToAbsent
          ? const Value.absent()
          : Value(entities),
      viewed:
          viewed == null && nullToAbsent ? const Value.absent() : Value(viewed),
      title: Value(title),
      content: Value(content),
      urlImage: Value(urlImage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      scheduledFor: Value(scheduledFor),
    );
  }

  factory Events.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Events(
      id: serializer.fromJson<String>(json['id']),
      entities: serializer.fromJson<String?>(json['entities']),
      viewed: serializer.fromJson<bool?>(json['viewed']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      urlImage: serializer.fromJson<String>(json['url_image']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
      scheduledFor: serializer.fromJson<String>(json['scheduled_for']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entities': serializer.toJson<String?>(entities),
      'viewed': serializer.toJson<bool?>(viewed),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'url_image': serializer.toJson<String>(urlImage),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
      'scheduled_for': serializer.toJson<String>(scheduledFor),
    };
  }

  Events copyWith(
          {String? id,
          Value<String?> entities = const Value.absent(),
          Value<bool?> viewed = const Value.absent(),
          String? title,
          String? content,
          String? urlImage,
          String? createdAt,
          String? updatedAt,
          String? scheduledFor}) =>
      Events(
        id: id ?? this.id,
        entities: entities.present ? entities.value : this.entities,
        viewed: viewed.present ? viewed.value : this.viewed,
        title: title ?? this.title,
        content: content ?? this.content,
        urlImage: urlImage ?? this.urlImage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        scheduledFor: scheduledFor ?? this.scheduledFor,
      );
  @override
  String toString() {
    return (StringBuffer('Events(')
          ..write('id: $id, ')
          ..write('entities: $entities, ')
          ..write('viewed: $viewed, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('urlImage: $urlImage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('scheduledFor: $scheduledFor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entities, viewed, title, content,
      urlImage, createdAt, updatedAt, scheduledFor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Events &&
          other.id == this.id &&
          other.entities == this.entities &&
          other.viewed == this.viewed &&
          other.title == this.title &&
          other.content == this.content &&
          other.urlImage == this.urlImage &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.scheduledFor == this.scheduledFor);
}

class EventsTableCompanion extends UpdateCompanion<Events> {
  final Value<String> id;
  final Value<String?> entities;
  final Value<bool?> viewed;
  final Value<String> title;
  final Value<String> content;
  final Value<String> urlImage;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String> scheduledFor;
  final Value<int> rowid;
  const EventsTableCompanion({
    this.id = const Value.absent(),
    this.entities = const Value.absent(),
    this.viewed = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.urlImage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsTableCompanion.insert({
    required String id,
    this.entities = const Value.absent(),
    this.viewed = const Value.absent(),
    required String title,
    required String content,
    required String urlImage,
    required String createdAt,
    required String updatedAt,
    required String scheduledFor,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        content = Value(content),
        urlImage = Value(urlImage),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        scheduledFor = Value(scheduledFor);
  static Insertable<Events> custom({
    Expression<String>? id,
    Expression<String>? entities,
    Expression<bool>? viewed,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? urlImage,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? scheduledFor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entities != null) 'entities': entities,
      if (viewed != null) 'viewed': viewed,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (urlImage != null) 'url_image': urlImage,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsTableCompanion copyWith(
      {Value<String>? id,
      Value<String?>? entities,
      Value<bool?>? viewed,
      Value<String>? title,
      Value<String>? content,
      Value<String>? urlImage,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String>? scheduledFor,
      Value<int>? rowid}) {
    return EventsTableCompanion(
      id: id ?? this.id,
      entities: entities ?? this.entities,
      viewed: viewed ?? this.viewed,
      title: title ?? this.title,
      content: content ?? this.content,
      urlImage: urlImage ?? this.urlImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entities.present) {
      map['entities'] = Variable<String>(entities.value);
    }
    if (viewed.present) {
      map['viewed'] = Variable<bool>(viewed.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (urlImage.present) {
      map['url_image'] = Variable<String>(urlImage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<String>(scheduledFor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsTableCompanion(')
          ..write('id: $id, ')
          ..write('entities: $entities, ')
          ..write('viewed: $viewed, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('urlImage: $urlImage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActionsTableTable extends ActionsTable
    with TableInfo<$ActionsTableTable, Actions> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _urlIconMeta =
      const VerificationMeta('urlIcon');
  @override
  late final GeneratedColumn<String> urlIcon = GeneratedColumn<String>(
      'url_icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, author, urlIcon, content, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'actions_table';
  @override
  String get actualTableName => 'actions_table';
  @override
  VerificationContext validateIntegrity(Insertable<Actions> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('url_icon')) {
      context.handle(_urlIconMeta,
          urlIcon.isAcceptableOrUnknown(data['url_icon']!, _urlIconMeta));
    } else if (isInserting) {
      context.missing(_urlIconMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Actions map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Actions(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      urlIcon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_icon'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ActionsTableTable createAlias(String alias) {
    return $ActionsTableTable(attachedDatabase, alias);
  }
}

class Actions extends DataClass implements Insertable<Actions> {
  final String id;
  final String author;
  final String urlIcon;
  final String content;
  final String createdAt;
  final String updatedAt;
  const Actions(
      {required this.id,
      required this.author,
      required this.urlIcon,
      required this.content,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['author'] = Variable<String>(author);
    map['url_icon'] = Variable<String>(urlIcon);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  ActionsTableCompanion toCompanion(bool nullToAbsent) {
    return ActionsTableCompanion(
      id: Value(id),
      author: Value(author),
      urlIcon: Value(urlIcon),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Actions.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Actions(
      id: serializer.fromJson<String>(json['id']),
      author: serializer.fromJson<String>(json['author']),
      urlIcon: serializer.fromJson<String>(json['url_icon']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'author': serializer.toJson<String>(author),
      'url_icon': serializer.toJson<String>(urlIcon),
      'content': serializer.toJson<String>(content),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  Actions copyWith(
          {String? id,
          String? author,
          String? urlIcon,
          String? content,
          String? createdAt,
          String? updatedAt}) =>
      Actions(
        id: id ?? this.id,
        author: author ?? this.author,
        urlIcon: urlIcon ?? this.urlIcon,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Actions(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('urlIcon: $urlIcon, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, author, urlIcon, content, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Actions &&
          other.id == this.id &&
          other.author == this.author &&
          other.urlIcon == this.urlIcon &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ActionsTableCompanion extends UpdateCompanion<Actions> {
  final Value<String> id;
  final Value<String> author;
  final Value<String> urlIcon;
  final Value<String> content;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const ActionsTableCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.urlIcon = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionsTableCompanion.insert({
    required String id,
    required String author,
    required String urlIcon,
    required String content,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        author = Value(author),
        urlIcon = Value(urlIcon),
        content = Value(content),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Actions> custom({
    Expression<String>? id,
    Expression<String>? author,
    Expression<String>? urlIcon,
    Expression<String>? content,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (urlIcon != null) 'url_icon': urlIcon,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? author,
      Value<String>? urlIcon,
      Value<String>? content,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return ActionsTableCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      urlIcon: urlIcon ?? this.urlIcon,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (urlIcon.present) {
      map['url_icon'] = Variable<String>(urlIcon.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionsTableCompanion(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('urlIcon: $urlIcon, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TweetsTableTable extends TweetsTable
    with TableInfo<$TweetsTableTable, Tweets> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TweetsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _urlIconMeta =
      const VerificationMeta('urlIcon');
  @override
  late final GeneratedColumn<String> urlIcon = GeneratedColumn<String>(
      'url_icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _postedAtMeta =
      const VerificationMeta('postedAt');
  @override
  late final GeneratedColumn<String> postedAt = GeneratedColumn<String>(
      'posted_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, author, urlIcon, content, createdAt, updatedAt, postedAt];
  @override
  String get aliasedName => _alias ?? 'tweets_table';
  @override
  String get actualTableName => 'tweets_table';
  @override
  VerificationContext validateIntegrity(Insertable<Tweets> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('url_icon')) {
      context.handle(_urlIconMeta,
          urlIcon.isAcceptableOrUnknown(data['url_icon']!, _urlIconMeta));
    } else if (isInserting) {
      context.missing(_urlIconMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('posted_at')) {
      context.handle(_postedAtMeta,
          postedAt.isAcceptableOrUnknown(data['posted_at']!, _postedAtMeta));
    } else if (isInserting) {
      context.missing(_postedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Tweets map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tweets(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      urlIcon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_icon'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      postedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}posted_at'])!,
    );
  }

  @override
  $TweetsTableTable createAlias(String alias) {
    return $TweetsTableTable(attachedDatabase, alias);
  }
}

class Tweets extends DataClass implements Insertable<Tweets> {
  final String id;
  final String author;
  final String urlIcon;
  final String content;
  final String createdAt;
  final String updatedAt;
  final String postedAt;
  const Tweets(
      {required this.id,
      required this.author,
      required this.urlIcon,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.postedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['author'] = Variable<String>(author);
    map['url_icon'] = Variable<String>(urlIcon);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['posted_at'] = Variable<String>(postedAt);
    return map;
  }

  TweetsTableCompanion toCompanion(bool nullToAbsent) {
    return TweetsTableCompanion(
      id: Value(id),
      author: Value(author),
      urlIcon: Value(urlIcon),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      postedAt: Value(postedAt),
    );
  }

  factory Tweets.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tweets(
      id: serializer.fromJson<String>(json['id']),
      author: serializer.fromJson<String>(json['author']),
      urlIcon: serializer.fromJson<String>(json['url_icon']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
      postedAt: serializer.fromJson<String>(json['posted_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'author': serializer.toJson<String>(author),
      'url_icon': serializer.toJson<String>(urlIcon),
      'content': serializer.toJson<String>(content),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
      'posted_at': serializer.toJson<String>(postedAt),
    };
  }

  Tweets copyWith(
          {String? id,
          String? author,
          String? urlIcon,
          String? content,
          String? createdAt,
          String? updatedAt,
          String? postedAt}) =>
      Tweets(
        id: id ?? this.id,
        author: author ?? this.author,
        urlIcon: urlIcon ?? this.urlIcon,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        postedAt: postedAt ?? this.postedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Tweets(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('urlIcon: $urlIcon, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('postedAt: $postedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, author, urlIcon, content, createdAt, updatedAt, postedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tweets &&
          other.id == this.id &&
          other.author == this.author &&
          other.urlIcon == this.urlIcon &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.postedAt == this.postedAt);
}

class TweetsTableCompanion extends UpdateCompanion<Tweets> {
  final Value<String> id;
  final Value<String> author;
  final Value<String> urlIcon;
  final Value<String> content;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String> postedAt;
  final Value<int> rowid;
  const TweetsTableCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.urlIcon = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.postedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TweetsTableCompanion.insert({
    required String id,
    required String author,
    required String urlIcon,
    required String content,
    required String createdAt,
    required String updatedAt,
    required String postedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        author = Value(author),
        urlIcon = Value(urlIcon),
        content = Value(content),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        postedAt = Value(postedAt);
  static Insertable<Tweets> custom({
    Expression<String>? id,
    Expression<String>? author,
    Expression<String>? urlIcon,
    Expression<String>? content,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? postedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (urlIcon != null) 'url_icon': urlIcon,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (postedAt != null) 'posted_at': postedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TweetsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? author,
      Value<String>? urlIcon,
      Value<String>? content,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String>? postedAt,
      Value<int>? rowid}) {
    return TweetsTableCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      urlIcon: urlIcon ?? this.urlIcon,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      postedAt: postedAt ?? this.postedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (urlIcon.present) {
      map['url_icon'] = Variable<String>(urlIcon.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (postedAt.present) {
      map['posted_at'] = Variable<String>(postedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TweetsTableCompanion(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('urlIcon: $urlIcon, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('postedAt: $postedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CronTableTable extends CronTable with TableInfo<$CronTableTable, Cron> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CronTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<String> lastUpdated = GeneratedColumn<String>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, lastUpdated, createdAt];
  @override
  String get aliasedName => _alias ?? 'cron_table';
  @override
  String get actualTableName => 'cron_table';
  @override
  VerificationContext validateIntegrity(Insertable<Cron> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Cron map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cron(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_updated'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CronTableTable createAlias(String alias) {
    return $CronTableTable(attachedDatabase, alias);
  }
}

class Cron extends DataClass implements Insertable<Cron> {
  final String id;
  final String name;
  final String lastUpdated;
  final String createdAt;
  const Cron(
      {required this.id,
      required this.name,
      required this.lastUpdated,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['last_updated'] = Variable<String>(lastUpdated);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  CronTableCompanion toCompanion(bool nullToAbsent) {
    return CronTableCompanion(
      id: Value(id),
      name: Value(name),
      lastUpdated: Value(lastUpdated),
      createdAt: Value(createdAt),
    );
  }

  factory Cron.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cron(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['table_name']),
      lastUpdated: serializer.fromJson<String>(json['last_updated']),
      createdAt: serializer.fromJson<String>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'table_name': serializer.toJson<String>(name),
      'last_updated': serializer.toJson<String>(lastUpdated),
      'created_at': serializer.toJson<String>(createdAt),
    };
  }

  Cron copyWith(
          {String? id, String? name, String? lastUpdated, String? createdAt}) =>
      Cron(
        id: id ?? this.id,
        name: name ?? this.name,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Cron(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lastUpdated, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cron &&
          other.id == this.id &&
          other.name == this.name &&
          other.lastUpdated == this.lastUpdated &&
          other.createdAt == this.createdAt);
}

class CronTableCompanion extends UpdateCompanion<Cron> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> lastUpdated;
  final Value<String> createdAt;
  final Value<int> rowid;
  const CronTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CronTableCompanion.insert({
    required String id,
    required String name,
    required String lastUpdated,
    required String createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        lastUpdated = Value(lastUpdated),
        createdAt = Value(createdAt);
  static Insertable<Cron> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? lastUpdated,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CronTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? lastUpdated,
      Value<String>? createdAt,
      Value<int>? rowid}) {
    return CronTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<String>(lastUpdated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CronTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RadarsTableTable extends RadarsTable
    with TableInfo<$RadarsTableTable, Radars> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RadarsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _viewedMeta = const VerificationMeta('viewed');
  @override
  late final GeneratedColumn<bool> viewed =
      GeneratedColumn<bool>('viewed', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("viewed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlImageMeta =
      const VerificationMeta('urlImage');
  @override
  late final GeneratedColumn<String> urlImage = GeneratedColumn<String>(
      'url_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, viewed, content, urlImage, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'radars_table';
  @override
  String get actualTableName => 'radars_table';
  @override
  VerificationContext validateIntegrity(Insertable<Radars> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('viewed')) {
      context.handle(_viewedMeta,
          viewed.isAcceptableOrUnknown(data['viewed']!, _viewedMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('url_image')) {
      context.handle(_urlImageMeta,
          urlImage.isAcceptableOrUnknown(data['url_image']!, _urlImageMeta));
    } else if (isInserting) {
      context.missing(_urlImageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Radars map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Radars(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      viewed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}viewed']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      urlImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_image'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RadarsTableTable createAlias(String alias) {
    return $RadarsTableTable(attachedDatabase, alias);
  }
}

class Radars extends DataClass implements Insertable<Radars> {
  final String id;
  final String title;
  final bool? viewed;
  final String content;
  final String urlImage;
  final String createdAt;
  final String updatedAt;
  const Radars(
      {required this.id,
      required this.title,
      this.viewed,
      required this.content,
      required this.urlImage,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || viewed != null) {
      map['viewed'] = Variable<bool>(viewed);
    }
    map['content'] = Variable<String>(content);
    map['url_image'] = Variable<String>(urlImage);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  RadarsTableCompanion toCompanion(bool nullToAbsent) {
    return RadarsTableCompanion(
      id: Value(id),
      title: Value(title),
      viewed:
          viewed == null && nullToAbsent ? const Value.absent() : Value(viewed),
      content: Value(content),
      urlImage: Value(urlImage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Radars.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Radars(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      viewed: serializer.fromJson<bool?>(json['viewed']),
      content: serializer.fromJson<String>(json['content']),
      urlImage: serializer.fromJson<String>(json['url_image']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'viewed': serializer.toJson<bool?>(viewed),
      'content': serializer.toJson<String>(content),
      'url_image': serializer.toJson<String>(urlImage),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  Radars copyWith(
          {String? id,
          String? title,
          Value<bool?> viewed = const Value.absent(),
          String? content,
          String? urlImage,
          String? createdAt,
          String? updatedAt}) =>
      Radars(
        id: id ?? this.id,
        title: title ?? this.title,
        viewed: viewed.present ? viewed.value : this.viewed,
        content: content ?? this.content,
        urlImage: urlImage ?? this.urlImage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Radars(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('viewed: $viewed, ')
          ..write('content: $content, ')
          ..write('urlImage: $urlImage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, viewed, content, urlImage, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Radars &&
          other.id == this.id &&
          other.title == this.title &&
          other.viewed == this.viewed &&
          other.content == this.content &&
          other.urlImage == this.urlImage &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RadarsTableCompanion extends UpdateCompanion<Radars> {
  final Value<String> id;
  final Value<String> title;
  final Value<bool?> viewed;
  final Value<String> content;
  final Value<String> urlImage;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const RadarsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.viewed = const Value.absent(),
    this.content = const Value.absent(),
    this.urlImage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RadarsTableCompanion.insert({
    required String id,
    required String title,
    this.viewed = const Value.absent(),
    required String content,
    required String urlImage,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        content = Value(content),
        urlImage = Value(urlImage),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Radars> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<bool>? viewed,
    Expression<String>? content,
    Expression<String>? urlImage,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (viewed != null) 'viewed': viewed,
      if (content != null) 'content': content,
      if (urlImage != null) 'url_image': urlImage,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RadarsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<bool?>? viewed,
      Value<String>? content,
      Value<String>? urlImage,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return RadarsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      viewed: viewed ?? this.viewed,
      content: content ?? this.content,
      urlImage: urlImage ?? this.urlImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (viewed.present) {
      map['viewed'] = Variable<bool>(viewed.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (urlImage.present) {
      map['url_image'] = Variable<String>(urlImage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RadarsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('viewed: $viewed, ')
          ..write('content: $content, ')
          ..write('urlImage: $urlImage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PricesTableTable extends PricesTable
    with TableInfo<$PricesTableTable, Prices> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PricesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isPriceUpMeta =
      const VerificationMeta('isPriceUp');
  @override
  late final GeneratedColumn<bool> isPriceUp =
      GeneratedColumn<bool>('is_price_up', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_price_up" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, price, name, icon, symbol, isPriceUp];
  @override
  String get aliasedName => _alias ?? 'prices_table';
  @override
  String get actualTableName => 'prices_table';
  @override
  VerificationContext validateIntegrity(Insertable<Prices> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('is_price_up')) {
      context.handle(
          _isPriceUpMeta,
          isPriceUp.isAcceptableOrUnknown(
              data['is_price_up']!, _isPriceUpMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Prices map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Prices(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      isPriceUp: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_price_up']),
    );
  }

  @override
  $PricesTableTable createAlias(String alias) {
    return $PricesTableTable(attachedDatabase, alias);
  }
}

class Prices extends DataClass implements Insertable<Prices> {
  final String id;
  final String? price;
  final String name;
  final String icon;
  final String symbol;
  final bool? isPriceUp;
  const Prices(
      {required this.id,
      this.price,
      required this.name,
      required this.icon,
      required this.symbol,
      this.isPriceUp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    map['symbol'] = Variable<String>(symbol);
    if (!nullToAbsent || isPriceUp != null) {
      map['is_price_up'] = Variable<bool>(isPriceUp);
    }
    return map;
  }

  PricesTableCompanion toCompanion(bool nullToAbsent) {
    return PricesTableCompanion(
      id: Value(id),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      name: Value(name),
      icon: Value(icon),
      symbol: Value(symbol),
      isPriceUp: isPriceUp == null && nullToAbsent
          ? const Value.absent()
          : Value(isPriceUp),
    );
  }

  factory Prices.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Prices(
      id: serializer.fromJson<String>(json['id']),
      price: serializer.fromJson<String?>(json['price']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
      symbol: serializer.fromJson<String>(json['symbol']),
      isPriceUp: serializer.fromJson<bool?>(json['is_price_up']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'price': serializer.toJson<String?>(price),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String>(icon),
      'symbol': serializer.toJson<String>(symbol),
      'is_price_up': serializer.toJson<bool?>(isPriceUp),
    };
  }

  Prices copyWith(
          {String? id,
          Value<String?> price = const Value.absent(),
          String? name,
          String? icon,
          String? symbol,
          Value<bool?> isPriceUp = const Value.absent()}) =>
      Prices(
        id: id ?? this.id,
        price: price.present ? price.value : this.price,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        symbol: symbol ?? this.symbol,
        isPriceUp: isPriceUp.present ? isPriceUp.value : this.isPriceUp,
      );
  @override
  String toString() {
    return (StringBuffer('Prices(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('symbol: $symbol, ')
          ..write('isPriceUp: $isPriceUp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, price, name, icon, symbol, isPriceUp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Prices &&
          other.id == this.id &&
          other.price == this.price &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.symbol == this.symbol &&
          other.isPriceUp == this.isPriceUp);
}

class PricesTableCompanion extends UpdateCompanion<Prices> {
  final Value<String> id;
  final Value<String?> price;
  final Value<String> name;
  final Value<String> icon;
  final Value<String> symbol;
  final Value<bool?> isPriceUp;
  final Value<int> rowid;
  const PricesTableCompanion({
    this.id = const Value.absent(),
    this.price = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.symbol = const Value.absent(),
    this.isPriceUp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PricesTableCompanion.insert({
    required String id,
    this.price = const Value.absent(),
    required String name,
    required String icon,
    required String symbol,
    this.isPriceUp = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        icon = Value(icon),
        symbol = Value(symbol);
  static Insertable<Prices> custom({
    Expression<String>? id,
    Expression<String>? price,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<String>? symbol,
    Expression<bool>? isPriceUp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (symbol != null) 'symbol': symbol,
      if (isPriceUp != null) 'is_price_up': isPriceUp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PricesTableCompanion copyWith(
      {Value<String>? id,
      Value<String?>? price,
      Value<String>? name,
      Value<String>? icon,
      Value<String>? symbol,
      Value<bool?>? isPriceUp,
      Value<int>? rowid}) {
    return PricesTableCompanion(
      id: id ?? this.id,
      price: price ?? this.price,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      symbol: symbol ?? this.symbol,
      isPriceUp: isPriceUp ?? this.isPriceUp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (isPriceUp.present) {
      map['is_price_up'] = Variable<bool>(isPriceUp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PricesTableCompanion(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('symbol: $symbol, ')
          ..write('isPriceUp: $isPriceUp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, Users> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discordIdMeta =
      const VerificationMeta('discordId');
  @override
  late final GeneratedColumn<String> discordId = GeneratedColumn<String>(
      'discord_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discordNameMeta =
      const VerificationMeta('discordName');
  @override
  late final GeneratedColumn<String> discordName = GeneratedColumn<String>(
      'discord_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discordRoleMeta =
      const VerificationMeta('discordRole');
  @override
  late final GeneratedColumn<String> discordRole = GeneratedColumn<String>(
      'discord_role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instagramValidationMeta =
      const VerificationMeta('instagramValidation');
  @override
  late final GeneratedColumn<String> instagramValidation =
      GeneratedColumn<String>('instagram_validation', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instagramValidatedMeta =
      const VerificationMeta('instagramValidated');
  @override
  late final GeneratedColumn<bool> instagramValidated =
      GeneratedColumn<bool>('instagram_validated', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("instagram_validated" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _setupCompleteMeta =
      const VerificationMeta('setupComplete');
  @override
  late final GeneratedColumn<bool> setupComplete =
      GeneratedColumn<bool>('setup_complete', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("setup_complete" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _avatarUrlMeta =
      const VerificationMeta('avatarUrl');
  @override
  late final GeneratedColumn<String> avatarUrl = GeneratedColumn<String>(
      'avatar_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        discordId,
        discordName,
        discordRole,
        email,
        instagramValidation,
        instagramValidated,
        setupComplete,
        avatarUrl
      ];
  @override
  String get aliasedName => _alias ?? 'users_table';
  @override
  String get actualTableName => 'users_table';
  @override
  VerificationContext validateIntegrity(Insertable<Users> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('discord_id')) {
      context.handle(_discordIdMeta,
          discordId.isAcceptableOrUnknown(data['discord_id']!, _discordIdMeta));
    } else if (isInserting) {
      context.missing(_discordIdMeta);
    }
    if (data.containsKey('discord_name')) {
      context.handle(
          _discordNameMeta,
          discordName.isAcceptableOrUnknown(
              data['discord_name']!, _discordNameMeta));
    } else if (isInserting) {
      context.missing(_discordNameMeta);
    }
    if (data.containsKey('discord_role')) {
      context.handle(
          _discordRoleMeta,
          discordRole.isAcceptableOrUnknown(
              data['discord_role']!, _discordRoleMeta));
    } else if (isInserting) {
      context.missing(_discordRoleMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('instagram_validation')) {
      context.handle(
          _instagramValidationMeta,
          instagramValidation.isAcceptableOrUnknown(
              data['instagram_validation']!, _instagramValidationMeta));
    } else if (isInserting) {
      context.missing(_instagramValidationMeta);
    }
    if (data.containsKey('instagram_validated')) {
      context.handle(
          _instagramValidatedMeta,
          instagramValidated.isAcceptableOrUnknown(
              data['instagram_validated']!, _instagramValidatedMeta));
    } else if (isInserting) {
      context.missing(_instagramValidatedMeta);
    }
    if (data.containsKey('setup_complete')) {
      context.handle(
          _setupCompleteMeta,
          setupComplete.isAcceptableOrUnknown(
              data['setup_complete']!, _setupCompleteMeta));
    } else if (isInserting) {
      context.missing(_setupCompleteMeta);
    }
    if (data.containsKey('avatar_url')) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta));
    } else if (isInserting) {
      context.missing(_avatarUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Users map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Users(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      discordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discord_id'])!,
      discordName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discord_name'])!,
      discordRole: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discord_role'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      instagramValidation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}instagram_validation'])!,
      instagramValidated: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}instagram_validated'])!,
      setupComplete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}setup_complete'])!,
      avatarUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar_url'])!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class Users extends DataClass implements Insertable<Users> {
  final String id;
  final String discordId;
  final String discordName;
  final String discordRole;
  final String email;
  final String instagramValidation;
  final bool instagramValidated;
  final bool setupComplete;
  final String avatarUrl;
  const Users(
      {required this.id,
      required this.discordId,
      required this.discordName,
      required this.discordRole,
      required this.email,
      required this.instagramValidation,
      required this.instagramValidated,
      required this.setupComplete,
      required this.avatarUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['discord_id'] = Variable<String>(discordId);
    map['discord_name'] = Variable<String>(discordName);
    map['discord_role'] = Variable<String>(discordRole);
    map['email'] = Variable<String>(email);
    map['instagram_validation'] = Variable<String>(instagramValidation);
    map['instagram_validated'] = Variable<bool>(instagramValidated);
    map['setup_complete'] = Variable<bool>(setupComplete);
    map['avatar_url'] = Variable<String>(avatarUrl);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      discordId: Value(discordId),
      discordName: Value(discordName),
      discordRole: Value(discordRole),
      email: Value(email),
      instagramValidation: Value(instagramValidation),
      instagramValidated: Value(instagramValidated),
      setupComplete: Value(setupComplete),
      avatarUrl: Value(avatarUrl),
    );
  }

  factory Users.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Users(
      id: serializer.fromJson<String>(json['id']),
      discordId: serializer.fromJson<String>(json['discord_id']),
      discordName: serializer.fromJson<String>(json['discord_name']),
      discordRole: serializer.fromJson<String>(json['discord_role']),
      email: serializer.fromJson<String>(json['email']),
      instagramValidation:
          serializer.fromJson<String>(json['instagram_validation']),
      instagramValidated:
          serializer.fromJson<bool>(json['instagram_validated']),
      setupComplete: serializer.fromJson<bool>(json['setup_complete']),
      avatarUrl: serializer.fromJson<String>(json['avatar_url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'discord_id': serializer.toJson<String>(discordId),
      'discord_name': serializer.toJson<String>(discordName),
      'discord_role': serializer.toJson<String>(discordRole),
      'email': serializer.toJson<String>(email),
      'instagram_validation': serializer.toJson<String>(instagramValidation),
      'instagram_validated': serializer.toJson<bool>(instagramValidated),
      'setup_complete': serializer.toJson<bool>(setupComplete),
      'avatar_url': serializer.toJson<String>(avatarUrl),
    };
  }

  Users copyWith(
          {String? id,
          String? discordId,
          String? discordName,
          String? discordRole,
          String? email,
          String? instagramValidation,
          bool? instagramValidated,
          bool? setupComplete,
          String? avatarUrl}) =>
      Users(
        id: id ?? this.id,
        discordId: discordId ?? this.discordId,
        discordName: discordName ?? this.discordName,
        discordRole: discordRole ?? this.discordRole,
        email: email ?? this.email,
        instagramValidation: instagramValidation ?? this.instagramValidation,
        instagramValidated: instagramValidated ?? this.instagramValidated,
        setupComplete: setupComplete ?? this.setupComplete,
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Users(')
          ..write('id: $id, ')
          ..write('discordId: $discordId, ')
          ..write('discordName: $discordName, ')
          ..write('discordRole: $discordRole, ')
          ..write('email: $email, ')
          ..write('instagramValidation: $instagramValidation, ')
          ..write('instagramValidated: $instagramValidated, ')
          ..write('setupComplete: $setupComplete, ')
          ..write('avatarUrl: $avatarUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, discordId, discordName, discordRole,
      email, instagramValidation, instagramValidated, setupComplete, avatarUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Users &&
          other.id == this.id &&
          other.discordId == this.discordId &&
          other.discordName == this.discordName &&
          other.discordRole == this.discordRole &&
          other.email == this.email &&
          other.instagramValidation == this.instagramValidation &&
          other.instagramValidated == this.instagramValidated &&
          other.setupComplete == this.setupComplete &&
          other.avatarUrl == this.avatarUrl);
}

class UsersTableCompanion extends UpdateCompanion<Users> {
  final Value<String> id;
  final Value<String> discordId;
  final Value<String> discordName;
  final Value<String> discordRole;
  final Value<String> email;
  final Value<String> instagramValidation;
  final Value<bool> instagramValidated;
  final Value<bool> setupComplete;
  final Value<String> avatarUrl;
  final Value<int> rowid;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.discordId = const Value.absent(),
    this.discordName = const Value.absent(),
    this.discordRole = const Value.absent(),
    this.email = const Value.absent(),
    this.instagramValidation = const Value.absent(),
    this.instagramValidated = const Value.absent(),
    this.setupComplete = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersTableCompanion.insert({
    required String id,
    required String discordId,
    required String discordName,
    required String discordRole,
    required String email,
    required String instagramValidation,
    required bool instagramValidated,
    required bool setupComplete,
    required String avatarUrl,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        discordId = Value(discordId),
        discordName = Value(discordName),
        discordRole = Value(discordRole),
        email = Value(email),
        instagramValidation = Value(instagramValidation),
        instagramValidated = Value(instagramValidated),
        setupComplete = Value(setupComplete),
        avatarUrl = Value(avatarUrl);
  static Insertable<Users> custom({
    Expression<String>? id,
    Expression<String>? discordId,
    Expression<String>? discordName,
    Expression<String>? discordRole,
    Expression<String>? email,
    Expression<String>? instagramValidation,
    Expression<bool>? instagramValidated,
    Expression<bool>? setupComplete,
    Expression<String>? avatarUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (discordId != null) 'discord_id': discordId,
      if (discordName != null) 'discord_name': discordName,
      if (discordRole != null) 'discord_role': discordRole,
      if (email != null) 'email': email,
      if (instagramValidation != null)
        'instagram_validation': instagramValidation,
      if (instagramValidated != null) 'instagram_validated': instagramValidated,
      if (setupComplete != null) 'setup_complete': setupComplete,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? discordId,
      Value<String>? discordName,
      Value<String>? discordRole,
      Value<String>? email,
      Value<String>? instagramValidation,
      Value<bool>? instagramValidated,
      Value<bool>? setupComplete,
      Value<String>? avatarUrl,
      Value<int>? rowid}) {
    return UsersTableCompanion(
      id: id ?? this.id,
      discordId: discordId ?? this.discordId,
      discordName: discordName ?? this.discordName,
      discordRole: discordRole ?? this.discordRole,
      email: email ?? this.email,
      instagramValidation: instagramValidation ?? this.instagramValidation,
      instagramValidated: instagramValidated ?? this.instagramValidated,
      setupComplete: setupComplete ?? this.setupComplete,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (discordId.present) {
      map['discord_id'] = Variable<String>(discordId.value);
    }
    if (discordName.present) {
      map['discord_name'] = Variable<String>(discordName.value);
    }
    if (discordRole.present) {
      map['discord_role'] = Variable<String>(discordRole.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (instagramValidation.present) {
      map['instagram_validation'] = Variable<String>(instagramValidation.value);
    }
    if (instagramValidated.present) {
      map['instagram_validated'] = Variable<bool>(instagramValidated.value);
    }
    if (setupComplete.present) {
      map['setup_complete'] = Variable<bool>(setupComplete.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String>(avatarUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('discordId: $discordId, ')
          ..write('discordName: $discordName, ')
          ..write('discordRole: $discordRole, ')
          ..write('email: $email, ')
          ..write('instagramValidation: $instagramValidation, ')
          ..write('instagramValidated: $instagramValidated, ')
          ..write('setupComplete: $setupComplete, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DappsTableTable extends DappsTable
    with TableInfo<$DappsTableTable, Dapps> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DappsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenNameMeta =
      const VerificationMeta('tokenName');
  @override
  late final GeneratedColumn<String> tokenName = GeneratedColumn<String>(
      'token_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlLogoMeta =
      const VerificationMeta('urlLogo');
  @override
  late final GeneratedColumn<String> urlLogo = GeneratedColumn<String>(
      'url_logo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, tokenName, urlLogo, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'dapps_table';
  @override
  String get actualTableName => 'dapps_table';
  @override
  VerificationContext validateIntegrity(Insertable<Dapps> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('token_name')) {
      context.handle(_tokenNameMeta,
          tokenName.isAcceptableOrUnknown(data['token_name']!, _tokenNameMeta));
    }
    if (data.containsKey('url_logo')) {
      context.handle(_urlLogoMeta,
          urlLogo.isAcceptableOrUnknown(data['url_logo']!, _urlLogoMeta));
    } else if (isInserting) {
      context.missing(_urlLogoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Dapps map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Dapps(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      tokenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token_name']),
      urlLogo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_logo'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DappsTableTable createAlias(String alias) {
    return $DappsTableTable(attachedDatabase, alias);
  }
}

class Dapps extends DataClass implements Insertable<Dapps> {
  final String id;
  final String name;
  final String color;
  final String? tokenName;
  final String urlLogo;
  final String createdAt;
  final String updatedAt;
  const Dapps(
      {required this.id,
      required this.name,
      required this.color,
      this.tokenName,
      required this.urlLogo,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    if (!nullToAbsent || tokenName != null) {
      map['token_name'] = Variable<String>(tokenName);
    }
    map['url_logo'] = Variable<String>(urlLogo);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DappsTableCompanion toCompanion(bool nullToAbsent) {
    return DappsTableCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      tokenName: tokenName == null && nullToAbsent
          ? const Value.absent()
          : Value(tokenName),
      urlLogo: Value(urlLogo),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Dapps.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dapps(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      tokenName: serializer.fromJson<String?>(json['token_name']),
      urlLogo: serializer.fromJson<String>(json['url_logo']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'token_name': serializer.toJson<String?>(tokenName),
      'url_logo': serializer.toJson<String>(urlLogo),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  Dapps copyWith(
          {String? id,
          String? name,
          String? color,
          Value<String?> tokenName = const Value.absent(),
          String? urlLogo,
          String? createdAt,
          String? updatedAt}) =>
      Dapps(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        tokenName: tokenName.present ? tokenName.value : this.tokenName,
        urlLogo: urlLogo ?? this.urlLogo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Dapps(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('tokenName: $tokenName, ')
          ..write('urlLogo: $urlLogo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, color, tokenName, urlLogo, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dapps &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.tokenName == this.tokenName &&
          other.urlLogo == this.urlLogo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DappsTableCompanion extends UpdateCompanion<Dapps> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> color;
  final Value<String?> tokenName;
  final Value<String> urlLogo;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const DappsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.tokenName = const Value.absent(),
    this.urlLogo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DappsTableCompanion.insert({
    required String id,
    required String name,
    required String color,
    this.tokenName = const Value.absent(),
    required String urlLogo,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        color = Value(color),
        urlLogo = Value(urlLogo),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Dapps> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? tokenName,
    Expression<String>? urlLogo,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (tokenName != null) 'token_name': tokenName,
      if (urlLogo != null) 'url_logo': urlLogo,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DappsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? color,
      Value<String?>? tokenName,
      Value<String>? urlLogo,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return DappsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      tokenName: tokenName ?? this.tokenName,
      urlLogo: urlLogo ?? this.urlLogo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (tokenName.present) {
      map['token_name'] = Variable<String>(tokenName.value);
    }
    if (urlLogo.present) {
      map['url_logo'] = Variable<String>(urlLogo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DappsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('tokenName: $tokenName, ')
          ..write('urlLogo: $urlLogo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NftsTableTable extends NftsTable with TableInfo<$NftsTableTable, Nfts> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NftsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenNameMeta =
      const VerificationMeta('tokenName');
  @override
  late final GeneratedColumn<String> tokenName = GeneratedColumn<String>(
      'token_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlLogoMeta =
      const VerificationMeta('urlLogo');
  @override
  late final GeneratedColumn<String> urlLogo = GeneratedColumn<String>(
      'url_logo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, tokenName, urlLogo, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'nfts_table';
  @override
  String get actualTableName => 'nfts_table';
  @override
  VerificationContext validateIntegrity(Insertable<Nfts> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('token_name')) {
      context.handle(_tokenNameMeta,
          tokenName.isAcceptableOrUnknown(data['token_name']!, _tokenNameMeta));
    }
    if (data.containsKey('url_logo')) {
      context.handle(_urlLogoMeta,
          urlLogo.isAcceptableOrUnknown(data['url_logo']!, _urlLogoMeta));
    } else if (isInserting) {
      context.missing(_urlLogoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Nfts map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Nfts(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      tokenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token_name']),
      urlLogo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_logo'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $NftsTableTable createAlias(String alias) {
    return $NftsTableTable(attachedDatabase, alias);
  }
}

class Nfts extends DataClass implements Insertable<Nfts> {
  final String id;
  final String name;
  final String color;
  final String? tokenName;
  final String urlLogo;
  final String createdAt;
  final String updatedAt;
  const Nfts(
      {required this.id,
      required this.name,
      required this.color,
      this.tokenName,
      required this.urlLogo,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    if (!nullToAbsent || tokenName != null) {
      map['token_name'] = Variable<String>(tokenName);
    }
    map['url_logo'] = Variable<String>(urlLogo);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  NftsTableCompanion toCompanion(bool nullToAbsent) {
    return NftsTableCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      tokenName: tokenName == null && nullToAbsent
          ? const Value.absent()
          : Value(tokenName),
      urlLogo: Value(urlLogo),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Nfts.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Nfts(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      tokenName: serializer.fromJson<String?>(json['token_name']),
      urlLogo: serializer.fromJson<String>(json['url_logo']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'token_name': serializer.toJson<String?>(tokenName),
      'url_logo': serializer.toJson<String>(urlLogo),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  Nfts copyWith(
          {String? id,
          String? name,
          String? color,
          Value<String?> tokenName = const Value.absent(),
          String? urlLogo,
          String? createdAt,
          String? updatedAt}) =>
      Nfts(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        tokenName: tokenName.present ? tokenName.value : this.tokenName,
        urlLogo: urlLogo ?? this.urlLogo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Nfts(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('tokenName: $tokenName, ')
          ..write('urlLogo: $urlLogo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, color, tokenName, urlLogo, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nfts &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.tokenName == this.tokenName &&
          other.urlLogo == this.urlLogo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NftsTableCompanion extends UpdateCompanion<Nfts> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> color;
  final Value<String?> tokenName;
  final Value<String> urlLogo;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const NftsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.tokenName = const Value.absent(),
    this.urlLogo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NftsTableCompanion.insert({
    required String id,
    required String name,
    required String color,
    this.tokenName = const Value.absent(),
    required String urlLogo,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        color = Value(color),
        urlLogo = Value(urlLogo),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Nfts> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? tokenName,
    Expression<String>? urlLogo,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (tokenName != null) 'token_name': tokenName,
      if (urlLogo != null) 'url_logo': urlLogo,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NftsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? color,
      Value<String?>? tokenName,
      Value<String>? urlLogo,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return NftsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      tokenName: tokenName ?? this.tokenName,
      urlLogo: urlLogo ?? this.urlLogo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (tokenName.present) {
      map['token_name'] = Variable<String>(tokenName.value);
    }
    if (urlLogo.present) {
      map['url_logo'] = Variable<String>(urlLogo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NftsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('tokenName: $tokenName, ')
          ..write('urlLogo: $urlLogo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChainsTableTable extends ChainsTable
    with TableInfo<$ChainsTableTable, Chains> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChainsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenNameMeta =
      const VerificationMeta('tokenName');
  @override
  late final GeneratedColumn<String> tokenName = GeneratedColumn<String>(
      'token_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlLogoMeta =
      const VerificationMeta('urlLogo');
  @override
  late final GeneratedColumn<String> urlLogo = GeneratedColumn<String>(
      'url_logo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, tokenName, urlLogo, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'chains_table';
  @override
  String get actualTableName => 'chains_table';
  @override
  VerificationContext validateIntegrity(Insertable<Chains> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('token_name')) {
      context.handle(_tokenNameMeta,
          tokenName.isAcceptableOrUnknown(data['token_name']!, _tokenNameMeta));
    }
    if (data.containsKey('url_logo')) {
      context.handle(_urlLogoMeta,
          urlLogo.isAcceptableOrUnknown(data['url_logo']!, _urlLogoMeta));
    } else if (isInserting) {
      context.missing(_urlLogoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Chains map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chains(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      tokenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token_name']),
      urlLogo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_logo'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ChainsTableTable createAlias(String alias) {
    return $ChainsTableTable(attachedDatabase, alias);
  }
}

class Chains extends DataClass implements Insertable<Chains> {
  final String id;
  final String name;
  final String color;
  final String? tokenName;
  final String urlLogo;
  final String createdAt;
  final String updatedAt;
  const Chains(
      {required this.id,
      required this.name,
      required this.color,
      this.tokenName,
      required this.urlLogo,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    if (!nullToAbsent || tokenName != null) {
      map['token_name'] = Variable<String>(tokenName);
    }
    map['url_logo'] = Variable<String>(urlLogo);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  ChainsTableCompanion toCompanion(bool nullToAbsent) {
    return ChainsTableCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      tokenName: tokenName == null && nullToAbsent
          ? const Value.absent()
          : Value(tokenName),
      urlLogo: Value(urlLogo),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Chains.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chains(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      tokenName: serializer.fromJson<String?>(json['token_name']),
      urlLogo: serializer.fromJson<String>(json['url_logo']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'token_name': serializer.toJson<String?>(tokenName),
      'url_logo': serializer.toJson<String>(urlLogo),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  Chains copyWith(
          {String? id,
          String? name,
          String? color,
          Value<String?> tokenName = const Value.absent(),
          String? urlLogo,
          String? createdAt,
          String? updatedAt}) =>
      Chains(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        tokenName: tokenName.present ? tokenName.value : this.tokenName,
        urlLogo: urlLogo ?? this.urlLogo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Chains(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('tokenName: $tokenName, ')
          ..write('urlLogo: $urlLogo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, color, tokenName, urlLogo, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chains &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.tokenName == this.tokenName &&
          other.urlLogo == this.urlLogo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ChainsTableCompanion extends UpdateCompanion<Chains> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> color;
  final Value<String?> tokenName;
  final Value<String> urlLogo;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const ChainsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.tokenName = const Value.absent(),
    this.urlLogo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChainsTableCompanion.insert({
    required String id,
    required String name,
    required String color,
    this.tokenName = const Value.absent(),
    required String urlLogo,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        color = Value(color),
        urlLogo = Value(urlLogo),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Chains> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? tokenName,
    Expression<String>? urlLogo,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (tokenName != null) 'token_name': tokenName,
      if (urlLogo != null) 'url_logo': urlLogo,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChainsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? color,
      Value<String?>? tokenName,
      Value<String>? urlLogo,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return ChainsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      tokenName: tokenName ?? this.tokenName,
      urlLogo: urlLogo ?? this.urlLogo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (tokenName.present) {
      map['token_name'] = Variable<String>(tokenName.value);
    }
    if (urlLogo.present) {
      map['url_logo'] = Variable<String>(urlLogo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChainsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('tokenName: $tokenName, ')
          ..write('urlLogo: $urlLogo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestingTableTable extends TestingTable
    with TableInfo<$TestingTableTable, Testing> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _testFieldMeta =
      const VerificationMeta('testField');
  @override
  late final GeneratedColumn<String> testField = GeneratedColumn<String>(
      'test_field', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, testField];
  @override
  String get aliasedName => _alias ?? 'testing_table';
  @override
  String get actualTableName => 'testing_table';
  @override
  VerificationContext validateIntegrity(Insertable<Testing> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('test_field')) {
      context.handle(_testFieldMeta,
          testField.isAcceptableOrUnknown(data['test_field']!, _testFieldMeta));
    } else if (isInserting) {
      context.missing(_testFieldMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Testing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Testing(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      testField: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}test_field'])!,
    );
  }

  @override
  $TestingTableTable createAlias(String alias) {
    return $TestingTableTable(attachedDatabase, alias);
  }
}

class Testing extends DataClass implements Insertable<Testing> {
  final String id;
  final String testField;
  const Testing({required this.id, required this.testField});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['test_field'] = Variable<String>(testField);
    return map;
  }

  TestingTableCompanion toCompanion(bool nullToAbsent) {
    return TestingTableCompanion(
      id: Value(id),
      testField: Value(testField),
    );
  }

  factory Testing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Testing(
      id: serializer.fromJson<String>(json['id']),
      testField: serializer.fromJson<String>(json['test_field']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'test_field': serializer.toJson<String>(testField),
    };
  }

  Testing copyWith({String? id, String? testField}) => Testing(
        id: id ?? this.id,
        testField: testField ?? this.testField,
      );
  @override
  String toString() {
    return (StringBuffer('Testing(')
          ..write('id: $id, ')
          ..write('testField: $testField')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, testField);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Testing &&
          other.id == this.id &&
          other.testField == this.testField);
}

class TestingTableCompanion extends UpdateCompanion<Testing> {
  final Value<String> id;
  final Value<String> testField;
  final Value<int> rowid;
  const TestingTableCompanion({
    this.id = const Value.absent(),
    this.testField = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestingTableCompanion.insert({
    required String id,
    required String testField,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        testField = Value(testField);
  static Insertable<Testing> custom({
    Expression<String>? id,
    Expression<String>? testField,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testField != null) 'test_field': testField,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestingTableCompanion copyWith(
      {Value<String>? id, Value<String>? testField, Value<int>? rowid}) {
    return TestingTableCompanion(
      id: id ?? this.id,
      testField: testField ?? this.testField,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (testField.present) {
      map['test_field'] = Variable<String>(testField.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestingTableCompanion(')
          ..write('id: $id, ')
          ..write('testField: $testField, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $NewsTableTable newsTable = $NewsTableTable(this);
  late final $ArticlesTableTable articlesTable = $ArticlesTableTable(this);
  late final $EventsTableTable eventsTable = $EventsTableTable(this);
  late final $ActionsTableTable actionsTable = $ActionsTableTable(this);
  late final $TweetsTableTable tweetsTable = $TweetsTableTable(this);
  late final $CronTableTable cronTable = $CronTableTable(this);
  late final $RadarsTableTable radarsTable = $RadarsTableTable(this);
  late final $PricesTableTable pricesTable = $PricesTableTable(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $DappsTableTable dappsTable = $DappsTableTable(this);
  late final $NftsTableTable nftsTable = $NftsTableTable(this);
  late final $ChainsTableTable chainsTable = $ChainsTableTable(this);
  late final $TestingTableTable testingTable = $TestingTableTable(this);
  Selectable<int> newsCount() {
    return customSelect('SELECT COUNT(*) AS _c0 FROM news_table AS n',
        variables: [],
        readsFrom: {
          newsTable,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }

  Selectable<int> articlesCount() {
    return customSelect('SELECT COUNT(*) AS _c0 FROM articles_table AS n',
        variables: [],
        readsFrom: {
          articlesTable,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }

  Selectable<int> eventsCount() {
    return customSelect('SELECT COUNT(*) AS _c0 FROM events_table AS n',
        variables: [],
        readsFrom: {
          eventsTable,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }

  Selectable<int> actionsCount() {
    return customSelect('SELECT COUNT(*) AS _c0 FROM actions_table AS n',
        variables: [],
        readsFrom: {
          actionsTable,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }

  Selectable<int> tweetsCount() {
    return customSelect('SELECT COUNT(*) AS _c0 FROM tweets_table AS n',
        variables: [],
        readsFrom: {
          tweetsTable,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }

  Selectable<int> cronCount() {
    return customSelect('SELECT COUNT(*) AS _c0 FROM cron_table AS n',
        variables: [],
        readsFrom: {
          cronTable,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }

  Selectable<int> radarsCount() {
    return customSelect('SELECT COUNT(*) AS _c0 FROM radars_table AS n',
        variables: [],
        readsFrom: {
          radarsTable,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        newsTable,
        articlesTable,
        eventsTable,
        actionsTable,
        tweetsTable,
        cronTable,
        radarsTable,
        pricesTable,
        usersTable,
        dappsTable,
        nftsTable,
        chainsTable,
        testingTable
      ];
}
