import 'package:dio/dio.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
Dio dio() {
  // String accessToken = CacheHelper.getData(key: 'token');
  var headers = {
    'accept': "application/json",
    'content-type': "application/json",
  };
  // if (accessToken != null) {
  //   headers['Authorization'] = "Bearer $accessToken";
  // }

  var dio = new Dio(
    BaseOptions(
      headers: headers,

    ),
  );
  return dio;
}
