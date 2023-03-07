import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_riverpod_app/DataLayer/Repositories/NewsRepository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Core/SharedProviders/SharedProviders.dart';
import '../DataLayer/Models/NewsModel.dart';
import '../DataLayer/WebServices/NewsWebService.dart';
part 'NewsProvider.g.dart';

@riverpod
class ControllerNews extends _$ControllerNews {
  List<Article> articlesList = [];
  @override
  List<Article> build() {
    final dataPro = ref.watch(getNewsProvider);

    dataPro.whenOrNull(
      data: (data) {
        for (int i = 0; i < data.articles.length; i++) {
          articlesList.add(data.articles[i]);
        }
      },
      error: (error, stackTrace) => articlesList = [],
      loading: () => null,
    );
    return articlesList;
  }

  removeItem(Article item) {
    articlesList.remove(item);
  }
}

@riverpod
NewsWebService newsApi(NewsApiRef ref) {
  final client = ref.watch(dioClientProvider);

  return NewsWebService(client);
}

@riverpod
NewsRepository newsRepository(NewsRepositoryRef ref) {
  final newsWS = ref.watch(newsApiProvider);
  return NewsRepository(newsWS);
}

@riverpod
Future<NewsModel> getNews(GetNewsRef ref) async {
  print("Hi");
  var newsRepo = ref.watch(newsRepositoryProvider);
  List<Article> articlesList;
  var data = await newsRepo.getNews();
  return data;
}
