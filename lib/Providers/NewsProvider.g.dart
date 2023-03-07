// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsApiHash() => r'5eaedb722846faaea9221e599260172f8519b88e';

/// See also [newsApi].
@ProviderFor(newsApi)
final newsApiProvider = AutoDisposeProvider<NewsWebService>.internal(
  newsApi,
  name: r'newsApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsApiRef = AutoDisposeProviderRef<NewsWebService>;
String _$newsRepositoryHash() => r'be5efc066c604fe85b59f59894910e51b0504481';

/// See also [newsRepository].
@ProviderFor(newsRepository)
final newsRepositoryProvider = AutoDisposeProvider<NewsRepository>.internal(
  newsRepository,
  name: r'newsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsRepositoryRef = AutoDisposeProviderRef<NewsRepository>;
String _$getNewsHash() => r'26b3559936cf1631204e34d0736fc1ae7192f384';

/// See also [getNews].
@ProviderFor(getNews)
final getNewsProvider = AutoDisposeFutureProvider<NewsModel>.internal(
  getNews,
  name: r'getNewsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getNewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNewsRef = AutoDisposeFutureProviderRef<NewsModel>;
String _$controllerNewsHash() => r'2f1016718e84d2ff8060c9de5ca937956d0ad224';

/// See also [ControllerNews].
@ProviderFor(ControllerNews)
final controllerNewsProvider =
    AutoDisposeNotifierProvider<ControllerNews, List<Article>>.internal(
  ControllerNews.new,
  name: r'controllerNewsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$controllerNewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ControllerNews = AutoDisposeNotifier<List<Article>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
