part of 'shipment_details_bloc.dart';

@immutable
 class ShipmentDetailsEvent {}

 class SendData extends ShipmentDetailsEvent{
 String collectAmount;
 String description;
  // String DeliveryTime;
 String weight;
 SendData(this.collectAmount,this.description,this.weight){
 print('paaaaapaaaaaaa');
 }}
class CheckCode extends ShipmentDetailsEvent{
 String code;
 String collectAmount;
 String description;
 // String DeliveryTime;
 String weight;

 CheckCode(this.code,this.weight,this.description,this.collectAmount){
  print(code);
  print(
      code + weight + description + collectAmount);
  print('ahahahahahahahaha');
 }
}
class ChangeButton extends ShipmentDetailsEvent{
int current ;
ChangeButton(this.current);
}
class Button extends ShipmentDetailsEvent{
 int index ;
 Button(this.index);
}