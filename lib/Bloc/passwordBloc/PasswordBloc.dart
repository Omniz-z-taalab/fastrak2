import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/passwordBloc/Password%20State.dart';
import 'package:fastrak2/Bloc/passwordBloc/PasswordEvent.dart';
import 'package:fastrak2/Bloc/passwordBloc/AuthenticationRepo.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/passwodApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  String phoneuser;
  String passworduser;
  String countryNameuser;
  passwordApi api;

  AuthenticationRepo authenticationRepo;
  PasswordBloc() : super(initialState());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) {
    if (event is PasswordUsser){
        passworduser = event.password;
        phoneuser = event.phone;
        countryNameuser =event.countryName;
      emit(PasswordLoading());
     PasswordBlocMethod();
    }
  }
  void PasswordBlocMethod(){
    Future<passwordApi> response = AuthenticationRepo.user(phoneuser, passworduser,countryNameuser,api);
    response.then((value) {
      emit(PasswordSuccess(value));
    }).catchError((onError){
      if(onError is DioError){
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print(ctch.errors.first.message);
        emit(PasswordErrorr(ctch.errors.first.message));
      }}
    );
  }
}