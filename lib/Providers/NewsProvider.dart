import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_riverpod_app/DataLayer/Repositories/NewsRepository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Core/SharedProviders/SharedProviders.dart';
import '../DataLayer/Models/NewsModel.dart';
import '../DataLayer/WebServices/NewsWebService.dart';
part 'NewsProvider.g.dart';

// class NewsProvider extends StateNotifier<AsyncValue<NewsModel>> {
//   NewsProvider(this.newsRepository) : super(const AsyncValue.loading()) {
//     getNews();
//     print("HIII22222I");
//   }

//   NewsRepository newsRepository;
//   bool isLoading = false;

//   Future<void> getNews() async {
//     print("HIIII");
//     try {
//       var data = await newsRepository.getNews();
//       state = AsyncValue.data(data);
//     } on Exception catch (e) {
//       state = AsyncValue.error(e, StackTrace.current);
//     }
//   }
// }

@riverpod
class ControllerNews extends _$ControllerNews {
  @override
  FutureOr<NewsModel> build() {
    return getData();
  }


  Future<NewsModel> getData() async {
     var newsRepo = ref.watch(newsRepositoryProvider);
    return await newsRepo.getNews();
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

// @riverpod
// Future<NewsModel> getNews(GetNewsRef ref) async {
//   print("Hi");
//   var newsRepo = ref.read(newsRepositoryProvider);
//   var data = await newsRepo.getNews();
//   return data;
// }
