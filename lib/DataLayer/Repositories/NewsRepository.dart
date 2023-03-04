import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_riverpod_app/DataLayer/Models/NewsModel.dart';

import '../../Core/Network/dio_exceptions.dart';
import '../WebServices/NewsWebService.dart';

class NewsRepository {
  final NewsWebService _newsWebService;
  NewsRepository(this._newsWebService);
  Future<NewsModel> getNews() async {
    try {
      final res = await _newsWebService.getNews();
      final model = NewsModel.fromJson(res);
      return model;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
