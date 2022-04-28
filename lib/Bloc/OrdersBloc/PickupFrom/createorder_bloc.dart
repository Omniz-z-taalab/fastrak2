import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/CreateRepo.dart';
import 'package:fastrak2/Bloc/passwordBloc/Password%20State.dart';
import 'package:fastrak2/Models/Api/CitiesApi.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/Models/Api/OrderList.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:meta/meta.dart';

part 'createorder_event.dart';

part 'createorder_state.dart';

class CreateorderBloc extends Bloc<CreateorderEvent, CreateorderState> {
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
int page = 1;
  CreateorderBloc() : super(CreateorderInitial()){
    add(CheckData());
    add(listOrderEvent(this.page));
    print('ashhhhhhhh');
  }

  @override
  Stream<CreateorderState> mapEventToState(CreateorderEvent event) {
    if (event is CheckData) {
      CitiesMethod();
      // AreasMethod();
    }
    if (event is listOrderEvent) {
        OrderList();
    }
    if (event is SendAddress) {
      print(event.phone);
      Clintname = event.ClintName;
      buildingName = event.BuildingName;
      apartment = event.Apartment;
      Phone = event.phone;
      Address = event.address;
      floorNumber = event.FloorNumber;
      city = event.city.id;
      areas = event.are.id;
      print('$city + ${areas}');
      print('ddddddddddddddddddpppppspspspsspspspspspspspspsps');

      emit(CreateLoadingState());

      PasswordBlocMethod();
    }
    if (event is onChange) {
      cityChange = event.city;
      areasOnChange = event.city.areas;
      print(cityChange.name);
      emit(Changestate(cityChange));
    }
    if (event is onAreaChange) {
      newArea = event.are;
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
      emit(SuccessFirstUser(value));
    }).catchError((onError) {
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print(ctch.errors.first.message);
        emit(ErrorState(ctch.errors.first.message));
      }
    });
  }

  void User() {
    Future<AdressUser> response = CreateRepo.UserData(
        Clintname, buildingName, Address, Phone, apartment, floorNumber,city,areas);
    response.then((value) {
      print(value.name);
      print('zaaaaaaaaaaaaaaaaaayed');
      emit(SuccessFirstUser(value));
    }).catchError((onError) {
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print(ctch.errors.first.message);
        emit(ErrorSecondUserState(ctch.errors.first.message));
      }
    });
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

    }).catchError((onError){
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print('hhhhhhhhhhhhhhhhhhh');

        print(ctch.errors.last.message);
        emit(ErrorSecondUserState(ctch.errors.first.message));
    }});
  }
  AreasMethod() {
    Future<List<Areas>> response = CreateRepo.UserAreas();
    response.then((aree) {
      // print(data.data.first.name.toString());
      // print(data.data.first.cities.first.name);
      // print(data.data.first.cities.first.areas.first.name.toString());
      print('ppppppp22p2p2p22p2p2p2p2p2p2p');
      print(aree.first.name.toString());
      print('########################################');

       emit(AreaseSuccess(aree));

    }).catchError((onError){
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print('hhhhhhhhhhhhhhhhhhh');

        print(ctch.errors.last.message);
        emit(ErrorSecondUserState(ctch.errors.first.message));
      }});
  }
  OrderList() {
    print('nmnbnmnbnmbnbn');
    Future<List<Order>> response = CreateRepo.Orders(page);
    response.then((data) {
      print('nmnbnmnbnmbnbn');
      print(data.first.toString());
      print('########################################');

      // emit();

    }).catchError((onError){
      print(onError.toString());
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print('hhhhhhhhhhhhhhhhhhh');

        print(ctch.errors.last.message);
        emit(ErrorSecondUserState(ctch.errors.first.message));
      }});
  }
}
