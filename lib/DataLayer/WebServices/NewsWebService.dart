import 'package:news_riverpod_app/Core/Constants/Endpoints.dart';

import '../../Core/Network/DioClient.dart';

class NewsWebService {
  final DioClient _dioClient;

  NewsWebService(this._dioClient);
  Future<Map<String, dynamic>> getNews() async {
    try {
      var response = await _dioClient.get(Endpoints.baseUrl);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
