import 'package:fastrak2/Models/Api/CitiesApi.dart';

class GetAddressEvent {}

class getEvent extends GetAddressEvent {}

class startScreenEvent extends GetAddressEvent{
}
class EditScreenEvent extends GetAddressEvent{}
class AddAddress extends GetAddressEvent {
  String ClintName;
  String BuildingName;
  String address;
  String phone;
  String Apartment;
  String FloorNumber;
  Cities city;
  Areas areas;

  AddAddress(this.ClintName, this.address, this.BuildingName, this.phone,
      this.Apartment, this.FloorNumber, this.areas, this.city);
}
class OncityChange extends GetAddressEvent{
  Cities city;
  OncityChange(this.city){
    print(city.name.toString() + 'omniaaaaaaaaa');
  }
}
class onAreachange extends GetAddressEvent{
Areas areas;

onAreachange(this.areas){
  print(areas.name.toString() + 'baaaaabaaaaaa');
}}
