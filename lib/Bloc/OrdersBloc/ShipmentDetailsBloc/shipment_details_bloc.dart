import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/CreateRepo.dart';
import 'package:fastrak2/Models/Api/ApiPrice.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/LastOrderApi.dart';
import 'package:fastrak2/Models/Api/PromoCodeApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:meta/meta.dart';

part 'shipment_details_event.dart';

part 'shipment_details_state.dart';

class ShipmentDetailsBloc
    extends Bloc<ShipmentDetailsEvent, ShipmentDetailsState> {
  CreateRepo repo;
  String code;
  String promoCode;
  String type = '1';
  String hasinsurance = "1";
  String weight ;
  String Discription ;
  String Collect;
  int State;
  int index ;
  int indexx ;
int Index;
  String pickupId ;
 String dileveryId ;
int numberofpice = 2;
int payment = 2;
int ispospayment = 2;
// int pickupoption = 2;
String readytime ;
int hasfragile = 3;
bool switchh = true;
bool fragileSwitch = false;
int pickupOption;
int value;
  ShipmentDetailsBloc() : super(ShipmentDetailsInitial());

  @override
  Stream<ShipmentDetailsState> mapEventToState(ShipmentDetailsEvent event) {
    if (event is SendData) {
      indexx = event.index;
      weight = event.weight;
      Collect = event.collectAmount;
      SipmentBlocMethod();
    }
    if (event is CheckCode) {

      Discription = event.description;
      Collect = event.collectAmount;
      promoCode = event.code;
      weight = event.weight;
      PromoCodeMethod();
    }
    if (event is ChangeButton) {
      State = event.current;
      emit(ChangeButtonSuccess(State));
    }
    if(event is eveent){
      pickupId = event.newuser.id;
      dileveryId =event.newman.id;
      Discription = event.description;
      pickupOption = event.value;
      weight =event.weight;
      Index =event.index;
      Collect = event.collectAmount;
      readytime = (event.integer.toString() + ':00');


      DoneofOrder();
    }
    if (event is DateTimeEvent){
      value = event.value;
      print(value.toString() + 'omniaaaaaaaaaaaa');
      emit(DataTimeSuccessState(value));
    }
    if(event is eventSwitch){
      print(event.status);
      switchh = event.status;
      print('ssssssssaaaasasasasasasa');
      emit(switchSuccess(switchh));
    }
    if (event is eventfragileSwitch){
      fragileSwitch = event.isSwitched;
      emit(fragileSwitchState(fragileSwitch));
    }
  }

  SipmentBlocMethod() {
    print(indexx.toString() + 'sdaadsadsadsadsada');
    Future<Coast> response = CreateRepo.priceData(
        type, indexx, hasinsurance, weight, Collect, promoCode);
    response.then((value) {
      print(value.totalShippingFees.toString() + 'ssssssssssssssssssssss');
      emit(CodeSuccess(value));
      emit(SuccessSipmentState(value, promoCode));
    }).catchError((onError) {
        print(onError.response.data);
        print(onError.message);
      print(onError.toString());
      if (onError is DioError) {
        ApiError ShipmentError = ApiError.fromJson(onError.response.data);
        print(ShipmentError.errors.first.message);
        emit(ErrorSipmentState(ShipmentError.errors.first.message));
      }
    });
  }

  PromoCodeMethod() {
    print('22222222222222222222222');
    print(Collect + weight + hasinsurance + type );
    Future<PromoCodeApi> response = CreateRepo.Promo(
        promoCode, type, index, hasinsurance, weight, Collect);
    response.then((promo) {
      print(type +
          index.toString() +
          Collect +
          promoCode +
          hasinsurance +
          weight);
      print('%%%%%%%%%%%%%%%%%%%%%%%');
      emit(SipmentBlocMethod());
    }).catchError((onError) {
      if (onError is DioError) {
        ApiError Error = ApiError.fromJson(onError.response.data);
        print(Error.errors.first.message);
        print('########################################');
        emit(CodeErorr(Error.errors.first.message));
      }
    });
  }
  DoneofOrder() {
    print('wwwwwwwwwwwwwwwww');
    print(weight);

    Future<LastOrderApi> response = CreateRepo.Last(type,pickupId,dileveryId,weight,hasinsurance,numberofpice,payment,Discription,Collect,ispospayment,pickupOption,readytime,hasfragile,Index);
    response.then((value) {
      print('aaaaaaaaaaa');
       // print(value.data.deliveryTime);
      emit(StateSuccess(value));
      // emit(SuccessSipmentState(value, promoCode));
    }).catchError((onError) {
      print(onError.toString());
      if (onError is DioError) {
        ApiError ShipmentError = ApiError.fromJson(onError.response.data);
        print(ShipmentError.errors.first.message);
        emit(ErrorSipmentState(ShipmentError.errors.first.message));
      }
    });
  }
}
