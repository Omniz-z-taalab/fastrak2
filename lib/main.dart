import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:fastrak2/count/counter%20screen.dart';
import 'package:fastrak2/Bloc/observer/blocObserver.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/screens/Home.dart';
import 'package:fastrak2/screens/Registar.dart';
import 'package:fastrak2/screens/log%20in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'count/string/string_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home:
        BlocProvider<StringBloc>(
        create: (context) => StringBloc(),
    child: HomePageBlocProvider(title: 'Flutter Demo Home Page'),
    )
    );
  }
}
