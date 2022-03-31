import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart'as Dio;
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/PasswordRepo.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/passwodApi.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:progress_dialog/progress_dialog.dart';

part 'password_state.dart';

class FastrakPasswordBloc extends Cubit<FastrakPasswordState> {
  FastrakPasswordBloc() : super(FastrakPasswordInitial());
  static FastrakPasswordBloc get(context) => BlocProvider.of(context);
  PasswordRepo repo;
  Error error;
}
  //
  //
  //   }
// void user({@required String password,
  // @required String countryName,
  // @required String phone
  // }){
  //   emit(FastrakPasswordLoading());
  // }



