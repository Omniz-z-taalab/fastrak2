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
  SendAddress(this.ClintName,this.address,this.BuildingName,this.phone,this.Apartment,this.FloorNumber);
}

 class ErrorEvent extends CreateorderEvent{}


