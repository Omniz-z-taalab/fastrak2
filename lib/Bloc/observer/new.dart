
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/passwodApi.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:flutter/cupertino.dart';
//
// class QuoteApiClient {
//   final DioHelper httpClient;
//
//   QuoteApiClient({
//     @required this.httpClient,
//   }) : assert(httpClient != null);
//
//   Future<passwordApi> fetchQuote({phone, cuontryName, password}) async {
//     final response = DioHelper.postData(url: PASSWORD,
//         data:{
//     'phone': phone,
//         'password': password,
//         'cuontryName': cuontryName}).then((value){
//             print(value.data);
//     }).catchError((onError){
//     print(onError.toString());
//   });
// }}