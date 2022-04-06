


import 'package:equatable/equatable.dart';

class PasswordEvent {}



class PasswordUsser extends PasswordEvent {
  String phone;
  String password;
  String countryName;
  PasswordUsser(this.phone,this.password,this.countryName){
    print(phone.toString());
    print(password.toString());
  }
}