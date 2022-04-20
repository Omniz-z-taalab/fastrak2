part of 'shipment_details_bloc.dart';

@immutable
abstract class ShipmentDetailsState {}

class ShipmentDetailsInitial extends ShipmentDetailsState {}
class SuccessSipmentState extends ShipmentDetailsState{
  Coast value;
  String promoCode;
  SuccessSipmentState(this.value,this.promoCode){
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
class CodeSuccess extends ShipmentDetailsState{
  Coast value;
  CodeSuccess(this.value){
    print('lalyyyyyyyy3wn');
  }
}
class CodeErorr extends ShipmentDetailsState{
  String onError;
  CodeErorr(this.onError){
    print(onError);
    print('yaaaaaaaarrrrrrrrrr');
  }
}
class ChangeButtonSuccess extends ShipmentDetailsState{
  int State;
  ChangeButtonSuccess(this.State){
    print('cccccccccccc' + State.toString());
  }
}
class ButtonSuccess extends ShipmentDetailsState{
  int index;
  ButtonSuccess(this.index);
}
class StateSuccess extends ShipmentDetailsState{
  LastOrderApi value;
  StateSuccess(this.value){
    print('lalyyyyyyyy3wn');
  }
}
class switchSuccess extends ShipmentDetailsState{
  bool switchh;
  switchSuccess(this.switchh){print(switchh.toString() + '@@@@@@@@@2');}
}
class fragileSwitchState extends ShipmentDetailsState{
  bool fragileSwitch;
  fragileSwitchState(this.fragileSwitch);
}
class DataTimeSuccessState extends ShipmentDetailsState{
  int value;
  DataTimeSuccessState(this.value){
    print(value.toString() + 'taalaaaaaaaaaab');
  }
}