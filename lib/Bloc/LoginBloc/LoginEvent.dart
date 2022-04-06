
import 'package:equatable/equatable.dart';
import 'package:fastrak2/Models/Api/checkuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';
@immutable
abstract class LoginEvent extends Equatable {
}

class CheeckUser extends LoginEvent {

 String phone;
CheckUser checkUser;
  CheeckUser(this.phone,{this.checkUser});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class LoginSucces extends LoginEvent{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
