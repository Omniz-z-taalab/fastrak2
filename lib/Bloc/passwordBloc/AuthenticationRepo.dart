import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/checkuser.dart';
import 'package:fastrak2/Models/Api/passwodApi.dart';
import 'package:fastrak2/network/endpoint.dart';

class AuthenticationRepo {
  static Future<passwordApi> user(
      phoneuser, passworduser, countryNameuser, api) async {
    print(passworduser + phoneuser + countryNameuser);
   Dio.Response response = await dio().post( PASSWORD, data: {
      'phone': passworduser,
      'countryName': countryNameuser,
      'password': phoneuser,
    }).then((value) {
      api = passwordApi.fromJson(value.data);
    });

    return api;
  }

  static Future<bool> LoginMethod(phonee, checkUser) async {
    Dio.Response response = await dio().post( LOGIN, data: {'phone': phonee}).then((value) {
      checkUser = CheckUser.fromJson(value.data);
    });

    print(checkUser.data.isExist);

    return checkUser.data.isExist;
  }
}
