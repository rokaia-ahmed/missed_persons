import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://16.171.40.96:9090/',
        receiveDataWhenStatusError: true,
         headers: {
           'Content-Type':'application/json',
         }
      ),
    );
  }
  static Future<Response> getData ({
    required String url,
    Map<String,dynamic>? query,
  }) async
  {
    dio.options.headers= {
      'Content-Type' : 'application/json',
      'Accept': 'application/json',
    };
    return await dio.get(url,
    queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data,
  }) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
    };
    return await dio.post(
        url,
        data: data,
    );
  }
  static Future<Response> postSearch({
    required String url,
    required  data,
  }) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
    };
    return await dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String token = '' ,
}) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
      'Authorization': token,
    };
     return await dio.put(
         url,
         queryParameters: query,
         data: data
     );
  }

}