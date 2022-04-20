import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/PickupFrom/createorder_bloc.dart';
import 'package:fastrak2/Bloc/OrdersBloc/PromoCodeBloc/promo_code_bloc.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/CitiesApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen extends StatefulWidget {

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Future<CitiesApi> UserCity() async {
    try{
      print('xxxxxxxxxxxxxxxxxxxxxx');
      Dio.Response response = await dio().get(CITIES);
      print('ggggggggggggggggg');
      CitiesApi model = CitiesApi.fromJson(response.data);
      print(model.data.first.name);
      print(model.data.first.cities.first.isInsideCity);}
    on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.message);
        print('gggggg');
      }}}
        TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {

          return Scaffold(
           body: Center(
            child: TextButton(
              child: Text('wwwww'),
    onPressed: () {
      UserCity();
    }),
           ),
          );}}