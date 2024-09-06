// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewFeedListResponse _$NewFeedListResponseFromJson(Map<String, dynamic> json) =>
    NewFeedListResponse(
      status: json['status'] as String?,
      feeds: (json['articles'] as List<dynamic>?)
          ?.map((e) => NewsFeedResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NewFeedListResponseToJson(
        NewFeedListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.feeds,
    };

NewsFeedResponse _$NewsFeedResponseFromJson(Map<String, dynamic> json) =>
    NewsFeedResponse(
      source: json['source'] == null
          ? null
          : NewsFeedSource.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['context'] as String?,
    );

Map<String, dynamic> _$NewsFeedResponseToJson(NewsFeedResponse instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'context': instance.content,
    };

NewsFeedSource _$NewsFeedSourceFromJson(Map<String, dynamic> json) =>
    NewsFeedSource(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NewsFeedSourceToJson(NewsFeedSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
