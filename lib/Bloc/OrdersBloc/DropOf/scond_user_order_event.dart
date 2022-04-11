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
  SecondUserEvent(this.ClintName,this.address,this.BuildingName,this.phone,this.Apartment,this.FloorNumber);
 }




