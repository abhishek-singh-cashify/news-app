import 'package:json_annotation/json_annotation.dart';

part 'news_feed_response.g.dart';

@JsonSerializable()
class NewFeedListResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "totalResults")
  int? totalResults;
  @JsonKey(name: "articles")
  List<NewsFeedResponse>? feeds;

  NewFeedListResponse({
    this.status,
    this.feeds,
    this.totalResults,
  });

  static NewFeedListResponse fromJson(Map<String, dynamic> data) => _$NewFeedListResponseFromJson(data);

  Map<String, dynamic> toJson() => _$NewFeedListResponseToJson(this);
}

@JsonSerializable()
class NewsFeedResponse {
  @JsonKey(name: "source")
  NewsFeedSource? source;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "urlToImage")
  String? urlToImage;
  @JsonKey(name: "publishedAt")
  String? publishedAt;
  @JsonKey(name: "context")
  String? content;

  NewsFeedResponse({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  static NewsFeedResponse fromJson(Map<String, dynamic> data) => _$NewsFeedResponseFromJson(data);

  Map<String, dynamic> toJson() => _$NewsFeedResponseToJson(this);
}

@JsonSerializable()
class NewsFeedSource {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  NewsFeedSource({this.id, this.name});

  static NewsFeedSource fromJson(Map<String, dynamic> data) => _$NewsFeedSourceFromJson(data);

  Map<String, dynamic> toJson() => _$NewsFeedSourceToJson(this);
}
