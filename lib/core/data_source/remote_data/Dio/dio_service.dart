import 'package:dio/dio.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../models/every_thing.dart';
import '../api_constant.dart';
class DioService {
  final Dio dio=Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org",
      queryParameters: {
        "apiKey": ApiConstant.apiKey,
      }
    )
  );
/// source
  /// https://newsapi.org/v2/top-headlines/sources
  DioService(){
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,


    ));
  }

Future <SourcesResponse>getAllCategory({required String category})async{
 try{
   var response=await dio.get(ApiConstant.endPointSource,queryParameters: {

     "category":category,
   });
   return SourcesResponse.fromJson(response.data);
 }on DioException catch(e){
   switch(e.type){

     case DioExceptionType.connectionTimeout:
       // TODO: Handle this case.
       throw UnimplementedError();
     case DioExceptionType.sendTimeout:
       // TODO: Handle this case.
       throw UnimplementedError();
     case DioExceptionType.receiveTimeout:
       // TODO: Handle this case.
       throw UnimplementedError();
     case DioExceptionType.badCertificate:
       // TODO: Handle this case.
       throw UnimplementedError();
     case DioExceptionType.badResponse:
       // TODO: Handle this case.
       throw UnimplementedError();
     case DioExceptionType.cancel:
       // TODO: Handle this case.
       throw UnimplementedError();
     case DioExceptionType.connectionError:
       // TODO: Handle this case.
       throw UnimplementedError();
     case DioExceptionType.unknown:
       // TODO: Handle this case.
       throw UnimplementedError();
   }
 }
  catch(e){
   rethrow;
 }
}
  /// everyThing
  /// https://newsapi.org/v2/everything
  Future<NewsResponse> getNewsById({required String sourceId }) async {
    try {
    var response=await dio.get(ApiConstant.endPointEveryThing,queryParameters: {

      "sources": sourceId,
    }
    );
    return NewsResponse.fromJson(response.data);

    } catch (e) {
      rethrow;
    }
  }
  Future<NewsResponse> getNewsBySearch({String ?searchNews}) async {
    try {
     var response=await dio.get(ApiConstant.endPointEveryThing,queryParameters: {
       "q":searchNews
     }

     );
     return NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}