import 'package:dio/dio.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
Dio dio() {
   String accessToken = CacheHelper.getData(key: 'token');
  var headers = {
    'accept': "application/json",
    'content-type': "application/json",
  };
  if (accessToken != null) {
     headers['Authorization'] = "Bearer $accessToken";
  }

  var dio = new Dio(
    BaseOptions(
       baseUrl: 'http://18.159.227.78:8080/api',
      headers: headers,

    ),

  );
  print(dio.options.headers.toString());
  // print(dio.toString() + 'xxxxxxxxx');
    return dio;
}
