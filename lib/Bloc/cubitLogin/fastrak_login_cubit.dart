
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/checkuser.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:fastrak2/screens/password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'fastrak_login_state.dart';

class FastrakLoginCubit extends Cubit<FastrakLoginState> {
  FastrakLoginCubit() : super(FastrakLoginInitial());
  static FastrakLoginCubit get(context) => BlocProvider.of(context);
  CheckUser checkUser ;
  void user({@required String phone}){
    emit(FastrakLoginLoading());
    DioHelper.postData(url: LOGIN,
        data:{
      'phone': phone,
        } ).then((value) {
       checkUser = CheckUser.fromJson(value.data);
       print(checkUser.data.isExist);
          print(value.data);
          emit(FastrakLoginSuccess(checkUser));
    }).catchError((error){
      emit(FastrakLoginError(error.toString()));
    });
  }
  }

