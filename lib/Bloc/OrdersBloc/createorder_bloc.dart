import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/CreateRepo.dart';
import 'package:fastrak2/Bloc/passwordBloc/Password%20State.dart';
import 'package:fastrak2/Models/Api/Error.dart';
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
  CreateorderBloc() : super(CreateorderInitial());


  @override
  Stream<CreateorderState> mapEventToState(CreateorderEvent event) {
            if(event is SendAddress){
              print(event.phone);
              Clintname = event.ClintName;
              buildingName =event.BuildingName;
              apartment = event.Apartment;
              Phone =event.phone;
              Address = event.address;
              floorNumber =event.FloorNumber;
              print(event.address);
              print('omniaaaaaaaaa3');
               emit(CreateLoadingState());

              PasswordBlocMethod();
            }

  }
  void PasswordBlocMethod() {
    Future<Data> response = CreateRepo.UserData(
        Clintname, buildingName, Address, Phone, apartment, floorNumber);
    response.then((value) {
      print(value.name);
      print('zaaaaaaaaaaaaaaaaaayed');
      emit(OrderSuccess(value));
    }).catchError((onError){
      if(onError is DioError){
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print(ctch.errors.first.message);
        emit(ErrorState(ctch.errors.first.message));
      }});
  }
}
