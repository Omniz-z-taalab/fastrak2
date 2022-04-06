import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/checkuser.dart';
import 'package:fastrak2/network/endpoint.dart';


class LoginRepo{

  static Future<bool> user(phonee,checkUser) async{

    await DioHelper.postData(url: LOGIN,
      data: {'phone': phonee}).then((value) {
        print('omniaaaaaaaaaaaaaaaa');
    checkUser = CheckUser.fromJson(value.data);
      }

    );

   print(checkUser.data.isExist);

   return checkUser.data.isExist;

    print(' dddddddddddd');

  }
}
