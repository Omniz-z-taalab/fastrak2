import 'package:dio/dio.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/passwodApi.dart';
import 'package:fastrak2/network/endpoint.dart';

class PasswordRepo{


  static Future<passwordApi> user(phoneuser,passworduser,countryNameuser,api) async{
    print('ppppppppppppppppppp');
    print(passworduser + phoneuser + countryNameuser);

    await DioHelper.postData(url: PASSWORD,
        data: {'phone': passworduser,
          'countryName': countryNameuser,
        'password': phoneuser,
        }).then((value) {
      print('omniaaaaaaaaaaaaaaaa333');
      api = passwordApi.fromJson(value.data);
    }

    );

    print(api.data.phone);

    return api;


    }

}