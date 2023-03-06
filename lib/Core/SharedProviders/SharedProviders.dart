import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Network/DioClient.dart';
part 'SharedProviders.g.dart';

@riverpod
Dio dioInstance(DioInstanceRef ref) {
  return Dio();
}

@riverpod
DioClient dioClient(DioClientRef ref) {
  final dio = ref.watch(dioInstanceProvider);
  return DioClient(dio);
}
