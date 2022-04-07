import 'package:dio/dio.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/Models/Api/checkuser.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:flutter/material.dart';

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
      baseUrl: 'http://3.126.221.243:8080/api',
      headers: headers,

    ),
  );
  print(headers.toString());
  print('ddddddddddddddd');

  return dio;
}

// class DioHelper{
//   static Dio dio;
//
//   static init(){
//     String token = CacheHelper.getData(key: 'token');
//   }
//     var headers = {
//       'accept': "application/json",
//       'content-type': "application/json",
//     };
//     if (token != null) {
//       headers['Authorization'] = "Bearer $token";
//     dio = Dio(
//         BaseOptions(
//           baseUrl: 'http://3.126.221.243:8080/api',
//           headers: headers,
//         )
//     );
//   }
//   static Future<Response> getData({
//     @required String url,
//     @required Map<String, dynamic> query,
//   }) async{
//     return await dio.get(url,queryParameters: query);
//
//   }
//   static Future<Response> postData({
//     @required String url,
//     Map<String, dynamic> query,
//     @required Map<String, dynamic> data,
//     String token,
//
//   }) async{
//     dio.options.headers ={
//       'Authorization':  token
//     };
//     return await dio.post(url,queryParameters: query,
//       data:data,
//     );
//
//   }
// }
