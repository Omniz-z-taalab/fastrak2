import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/CreateRepo.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:meta/meta.dart';

part 'scond_user_order_event.dart';
part 'scond_user_order_state.dart';

class DropOfOrderBloc extends Bloc<DropOfOrderEvent, DropOfOrderState> {
  String Clintname;
  String buildingName;
  String Address;
  String Phone;
  String apartment;
  String floorNumber;
  CreateRepo createRepo;
  DropOfOrderBloc() : super(ScondUserOrderInitial()) {}

  @override
  Stream<DropOfOrderState> mapEventToState(DropOfOrderEvent event) {
    if(event is SecondUserEvent){
      print(event.phone);
      Clintname = event.ClintName;
      buildingName =event.BuildingName;
      apartment = event.Apartment;
      Phone =event.phone;
      Address = event.address;
      floorNumber =event.FloorNumber;
      print(event.address);
      print('omniaaaaaaaaa3');
      emit(LoadingSecondUser());

      PasswordBlocMethod();
    }

  }
  void PasswordBlocMethod() {
    Future<Data> response = CreateRepo.UserData(
        Clintname, buildingName, Address, Phone, apartment, floorNumber);
    response.then((value) {
      print(value.name);
      print('zaaaaaaaaaaaaaaaaaayed');
      emit(SuccessSecondUser(value));
    }).catchError((onError){
      if(onError is DioError){
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print(ctch.errors.first.message);
        emit(ErrorSecondUserState(ctch.errors.first.message));
      }});
  }
}
