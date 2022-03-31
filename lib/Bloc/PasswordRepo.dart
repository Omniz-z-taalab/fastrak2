import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/cubitLogin/password_cubit.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/passwodApi.dart';
import 'package:fastrak2/network/endpoint.dart';
//
class PasswordRepo extends FastrakPasswordBloc{

void PasswordUser({String phone, String cuontryName,String password})async{

  passwordApi checkPassword;
  Error dioError;
  print('ramyyyyyyyyyy');
  await DioHelper.postData(url: PASSWORD,
      data:{
        'phone': phone,
        'password': password,
        'cuontryName': cuontryName
      } ).then((value) {
    checkPassword = passwordApi.fromJson(value.data);
    print(checkPassword.data.hasPassword);
    print(value.data);
emit(FastrakPasswordSuccess(checkPassword));
      }).catchError((onError){
    if(onError is DioError){
      dioError = Error.fromJson(onError.error);
      print(dioError.errors[0].message);
      emit(FastrakPasswordError(dioError));
    }

  });
}
}