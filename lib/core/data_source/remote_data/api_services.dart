import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/data_source/remote_data/api_constant.dart';
import 'package:news_app/core/models/every_thing.dart';
import 'package:news_app/core/models/source_model.dart';

class ApiServices {
  static Future<SourcesResponse> get({required String category}) async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.endPointSource, {
      "apiKey": ApiConstant.apiKey,
      "category":category,
      // "language":language
    });
    try {
      var response = await http.get(url);

      var res = jsonDecode(response.body);
      return SourcesResponse.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNewsById({required String sourceId }) async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.endPointEveryThing, {
        "apiKey": ApiConstant.apiKey,
        "sources": sourceId,



      });
      var response = await http.get(url);
      var res = jsonDecode(response.body);
      return NewsResponse.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
  Future<NewsResponse> getNewsBySearch({String ?searchNews}) async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.endPointEveryThing, {
        "apiKey": ApiConstant.apiKey,
        "q":searchNews


      });
      var response = await http.get(url);
      var res = jsonDecode(response.body);
      return NewsResponse.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
