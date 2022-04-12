import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/CreateRepo.dart';
import 'package:fastrak2/Models/Api/ApiPrice.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/PromoCodeApi.dart';
import 'package:meta/meta.dart';

part 'shipment_details_event.dart';
part 'shipment_details_state.dart';

class   ShipmentDetailsBloc extends Bloc<ShipmentDetailsEvent, ShipmentDetailsState> {
  CreateRepo repo;
  String code;
  String promoCode ;
  String type = '2';
  String deliverytime = '2';
  String hasinsurance = "1";
  String weight;
  String moneycollected;
  String Discription;
   String Collect;
   int State;
   int index;

  ShipmentDetailsBloc() : super(ShipmentDetailsInitial()) ;

  @override
  Stream<ShipmentDetailsState> mapEventToState(ShipmentDetailsEvent event) {
      if(event is SendData){
      deliverytime;
        weight=  event.weight;
        moneycollected =event.collectAmount;
        SipmentBlocMethod();}
          if(event is CheckCode){
            print(event.collectAmount);
            print(event.description);
            Discription = event.description;
            moneycollected = event.collectAmount;
            promoCode = event.code;
            deliverytime;
            weight = event.weight;
            PromoCodeMethod();
          }
          if(event is ChangeButton){
            print('@@@@@ ${event.current}');
            State =  event.current ;
            emit(ChangeButtonSuccess(State));
          }

  }
   SipmentBlocMethod() {
    Future<Coast> response = CreateRepo.priceData(type,deliverytime,hasinsurance,weight,moneycollected,promoCode);
    response.then((value) {
       print(value.shippingFees);
emit(CodeSuccess(value));
      emit(SuccessSipmentState(value,promoCode));

    }).catchError((onError){
      print(onError.toString());
      if(onError is DioError){
        ApiError ShipmentError = ApiError.fromJson(onError.response.data);
        print(ShipmentError.errors.first.message);
        emit(ErrorSipmentState(ShipmentError.errors.first.message));
      }});
  }
   PromoCodeMethod() {
     print('22222222222222222222222');
     print(  moneycollected   + weight + hasinsurance + type + deliverytime );
    Future<PromoCodeApi> response = CreateRepo.Promo(promoCode,type,deliverytime,hasinsurance,weight,moneycollected);
    response.then((promo) {
      print(type + deliverytime + moneycollected + promoCode + hasinsurance + weight);
      print('%%%%%%%%%%%%%%%%%%%%%%%');
      emit(SipmentBlocMethod());
    }).catchError((onError){
      if(onError is DioError) {
        ApiError Error = ApiError.fromJson(onError.response.data);
        print(Error.errors.first.message);
        print('########################################');
        emit(CodeErorr(Error.errors.first.message));
      } });
  }

}
