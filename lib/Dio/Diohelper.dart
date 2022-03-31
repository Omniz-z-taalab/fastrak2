import 'package:dio/dio.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:flutter/material.dart';

class DioHelper{

  static Dio dio;
  static init(){
    var headers = {
      'accept': "application/json",
      'content-type': "application/json",
    };
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://18.159.227.78:8080/api',
      headers: headers,
      )
    );
  }
  static Future<Response> getData({
  @required String url,
    @required Map<String, dynamic> query,
}) async{
    return await dio.get(url,queryParameters: query);

  }
  static Future<Response> postData({
    @required String url,
     Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String token,

  }) async{
    dio.options.headers ={
      'Authorization':  token
    };
    return await dio.post(url,queryParameters: query,
    data:data,
    );

  }
}
