// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'NewsModel.freezed.dart';
part 'NewsModel.g.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

@freezed
class NewsModel with _$NewsModel {
    const factory NewsModel({
        required String status,
        required int totalResults,
        required List<Article> articles,
    }) = _NewsModel;

    factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}

@freezed
class Article with _$Article {
    const factory Article({
        required Source source,
        required String author,
        required String title,
        required dynamic description,
        required String url,
        required dynamic urlToImage,
        required String publishedAt,
        required dynamic content,
    }) = _Article;

    factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}

@freezed
class Source with _$Source {
    const factory Source({
        required String id,
        required String name,
    }) = _Source;

    factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
