import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:fastrak2/Bloc/LoginBloc/LogInScreen.dart';
import 'package:fastrak2/Bloc/LoginBloc/LoginBloc.dart';
import 'package:fastrak2/Bloc/observer/blocObserver.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  Widget widget;
  String token = CacheHelper.getData(key: 'token');
  if (token != null) {
    widget = Home();
  } else {
    widget = Login();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startWidget,
    );
  }
}
