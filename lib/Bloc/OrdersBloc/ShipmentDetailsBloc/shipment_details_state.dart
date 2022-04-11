part of 'shipment_details_bloc.dart';

@immutable
abstract class ShipmentDetailsState {}

class ShipmentDetailsInitial extends ShipmentDetailsState {}
class SuccessSipmentState extends ShipmentDetailsState{
  Coast value;
  SuccessSipmentState(this.value){
    print('3abdooooooooo');

  }
}
class ErrorSipmentState extends ShipmentDetailsState{
  String ShipmentError;

  ErrorSipmentState(this.ShipmentError){
    print(ShipmentError.toString());
    print('3abdooooooooo');
  }
}