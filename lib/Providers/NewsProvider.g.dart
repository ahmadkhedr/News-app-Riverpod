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
String _$controllerNewsHash() => r'4a34a6f294781db17b183dccce78e380d89da718';

/// See also [ControllerNews].
@ProviderFor(ControllerNews)
final controllerNewsProvider =
    AutoDisposeAsyncNotifierProvider<ControllerNews, NewsModel>.internal(
  ControllerNews.new,
  name: r'controllerNewsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$controllerNewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ControllerNews = AutoDisposeAsyncNotifier<NewsModel>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
