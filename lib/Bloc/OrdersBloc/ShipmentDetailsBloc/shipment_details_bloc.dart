import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/CreateRepo.dart';
import 'package:fastrak2/Models/Api/ApiPrice.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:meta/meta.dart';

part 'shipment_details_event.dart';
part 'shipment_details_state.dart';

class   ShipmentDetailsBloc extends Bloc<ShipmentDetailsEvent, ShipmentDetailsState> {
  CreateRepo repo;
  ShipmentDetailsBloc() : super(ShipmentDetailsInitial()) ;

  @override
  Stream<ShipmentDetailsState> mapEventToState(ShipmentDetailsEvent event) {
      if(event is SendData){
        print('ccccccccccc');
        print(event.collectAmount);
        print(event.description);
        SipmentBlocMethod();
      }

  }
  void SipmentBlocMethod() {
    Future<Coast> response = CreateRepo.priceData();
    response.then((value) {
      print('zaaaaaaaaaaaaaaaaaayed');

      print('abdoooooooooo');
      emit(SuccessSipmentState(value));
    }).catchError((onError){
      if(onError is DioError){
        ApiError ShipmentError = ApiError.fromJson(onError.response.data);
        print(ShipmentError.errors.first.message);
        emit(ErrorSipmentState(ShipmentError.errors.first.message));
      }});
  }
}
