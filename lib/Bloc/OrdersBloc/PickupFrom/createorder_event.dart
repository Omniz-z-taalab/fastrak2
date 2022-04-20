part of 'createorder_bloc.dart';

@immutable
abstract class CreateorderEvent {}

 class SendAddress extends CreateorderEvent{
  String ClintName;
  String BuildingName;
  String address;
  String phone;
  String Apartment;
  String FloorNumber;
  Cities city;
  Areas are;
  SendAddress(this.ClintName,this.address,this.BuildingName,this.phone,this.Apartment,this.FloorNumber,this.are,this.city);
}

 class ErrorEvent extends CreateorderEvent{}


class CheckData extends CreateorderEvent{

}
class onChange extends CreateorderEvent{
Cities city;
onChange(this.city){
 print(city.name.toString() + 'omniaaaaaaaaa');
}
}
class onAreaChange extends CreateorderEvent{
 Areas are;
  onAreaChange(this.are){
   print(are.name.toString() + 'baaaaabaaaaaa');
  }

}
class Areaseevent extends CreateorderEvent{

}
