import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_riverpod_app/DataLayer/Repositories/NewsRepository.dart';

import '../Core/SharedProviders/SharedProviders.dart';
import '../DataLayer/Models/NewsModel.dart';
import '../DataLayer/WebServices/NewsWebService.dart';

class NewsProvider extends StateNotifier<AsyncValue<NewsModel>> {
  NewsProvider(this.newsRepository) : super(const AsyncValue.loading()) {
    getNews();
    print("HIII22222I");
  }

  NewsRepository newsRepository;
  bool isLoading = false;

  Future<void> getNews() async {
    print("HIIII");
    try {
      var data = await newsRepository.getNews();
      state = AsyncValue.data(data);
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final NewsApiProvider = Provider<NewsWebService>(
  (ref) {
    return NewsWebService(ref.read(dioClientProvider));
  },
);

final NewsRepositoryProvider = Provider<NewsRepository>(
  (ref) {
    return NewsRepository(ref.read(NewsApiProvider));
  },
);

final newsStateNotifierProvider =
    StateNotifierProvider.autoDispose<NewsProvider, AsyncValue<NewsModel>>((ref) {
  var newsRepo = ref.read(NewsRepositoryProvider);
  return NewsProvider(newsRepo);
});

final getNewsProvider = FutureProvider<NewsModel>(
  (ref) async {
    print("Hi");
    var newsRepo = ref.read(NewsRepositoryProvider);
    var data = await newsRepo.getNews();
    return data;
  },
);
