import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/CreateRepo.dart';
import 'package:fastrak2/Models/Api/CitiesApi.dart';
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
  Cities cityChange;
  List<Areas> areasOnChange;
  Areas newArea;
  String city;
  String areas;
  DropOfOrderBloc() : super(ScondUserOrderInitial()) {
  add(CheckDataCities());
  }

  @override
  Stream<DropOfOrderState> mapEventToState(DropOfOrderEvent event) {
    if (event is CheckDataCities) {
      CitiesMethod();
      // AreasMethod();
    }

    if(event is SecondUserEvent){
      print(event.phone);
      Clintname = event.ClintName;
      buildingName =event.BuildingName;
      apartment = event.Apartment;
      Phone =event.phone;
      Address = event.address;
      floorNumber =event.FloorNumber;
      city =event.ccity.id;
      areas =event.aree.id;
      print('$city +${areas}');
      print(event.address);
      print('omniaaaaaaaaa3');
      emit(LoadingSecondUser());
      PasswordBlocMethod();
    }
    if (event is OnChange){
      cityChange =event.ccity;
      areasOnChange = event.ccity.areas;
      print(cityChange.name);
      emit(Changestate(cityChange,areasOnChange));
    }
    if( event is OnAreaChange){
      newArea = event.aree;
      print(newArea.name.toString() + 'xaaaaaaaaaax');
      emit(AreasOnChange(newArea));
    }

  }
  void PasswordBlocMethod() {
    Future<AdressUser> response = CreateRepo.UserData(
        Clintname, buildingName, Address, Phone, apartment, floorNumber,city,areas);
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
  CitiesMethod() {
    Future<List<Cities>> response = CreateRepo.UserCity();
    response.then((data) {
      // print(data.data.first.name.toString());
      // print(data.data.first.cities.first.name);
      // print(data.data.first.cities.first.areas.first.name.toString());
      print('########################################');
      print(data.first.name.toString());
      print(data.last.name);
      print('########################################');

      emit(CheckDataSuccess(data));
    });
    }}
