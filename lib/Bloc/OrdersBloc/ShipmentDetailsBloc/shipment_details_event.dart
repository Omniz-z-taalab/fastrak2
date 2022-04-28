part of 'shipment_details_bloc.dart';

@immutable
 class ShipmentDetailsEvent {}

 class SendData extends ShipmentDetailsEvent{
 String collectAmount ;
 String description;
  // String DeliveryTime;
 String weight;
 int index;
 SendData(this.collectAmount,this.description,this.weight,this.index,){
  print(index);
 print('paaaaapaaaaaaa');
 }}
class CheckCode extends ShipmentDetailsEvent{
 String code;
 String collectAmount;
 String description;
 // String DeliveryTime;
 String weight;
int index;
 CheckCode(this.code,this.weight,this.description,this.collectAmount,this.index){
  print(code);
  print(
      code + weight + description + collectAmount + index.toString());
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
class eventSwitch extends ShipmentDetailsEvent{
 bool status;
 eventSwitch(this.status);
}
class eveent extends ShipmentDetailsEvent{
 String weight;
 String DeliveryTime;
 AdressUser newman;
 AdressUser newuser;
 String collectAmount = '0';
 String description;
 bool isSwitched;
 int index;
 int integer;
 int eeeee;
 int current;
 String dropdownValue;
 int value;
 eveent(
     this.isSwitched,
     this.weight,
     this.DeliveryTime,
     this.newman,
     this.newuser,
     this.collectAmount,
     this.description,
     this.index,
     this.integer,
     this.eeeee,
     this.current,
     this.dropdownValue,this.value){
  print('${isSwitched}+ ${weight}+$DeliveryTime+$newman+$newuser+$collectAmount+$description+$index+$integer+$eeeee+$current+$dropdownValue');
  print('cccccccccccccccccccc');
 }
}

class eventfragileSwitch extends ShipmentDetailsEvent{
 bool isSwitched;
 eventfragileSwitch(this.isSwitched){print(isSwitched.toString() + 'dsddmkfkfkfkffkkffk');}
}
class DateTimeEvent extends ShipmentDetailsEvent{
 int value;
 DateTimeEvent(this.value){
  print(value.toString() + 'xxxxxxxxxxxxx' );
 }
}