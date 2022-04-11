part of 'shipment_details_bloc.dart';

@immutable
 class ShipmentDetailsEvent {}

 class SendData extends ShipmentDetailsEvent{
 String collectAmount;
 String description;
 SendData(this.collectAmount,this.description){
 print('paaaaapaaaaaaa');
 }}