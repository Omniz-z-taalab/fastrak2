part of 'scond_user_order_bloc.dart';

@immutable
 class DropOfOrderEvent {}

 class SecondUserEvent extends DropOfOrderEvent{
  String ClintName;
  String BuildingName;
  String address;
  String phone;
  String Apartment;
  String FloorNumber;
  Cities ccity;
  Areas aree;
  SecondUserEvent(this.ClintName,this.address,this.BuildingName,this.phone,this.Apartment,this.FloorNumber,this.ccity,this.aree);
 }


class CheckDataCities extends DropOfOrderEvent{

}


class OnChange extends DropOfOrderEvent{
 Cities ccity;
 OnChange(this.ccity){
  print(ccity.name.toString() + 'omniaaaaaaaaa');
 }
}
class OnAreaChange extends DropOfOrderEvent{
 Areas aree;
 OnAreaChange(this.aree){
  print(aree.name.toString() + 'baaaaabaaaaaa');
 }

}
