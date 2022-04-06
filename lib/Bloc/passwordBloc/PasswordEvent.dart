


import 'package:equatable/equatable.dart';

class PasswordEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class PasswordSuccess extends PasswordEvent{}

class PasswordError extends PasswordEvent{}


class PasswordUsser extends PasswordEvent {
  String phone;
  String password;
  String countryName;
  PasswordUsser(this.phone,this.password,this.countryName){
    print(phone.toString());
    print(password.toString());
  }
}