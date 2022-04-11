import 'package:fastrak2/Models/Api/checkuser.dart';

abstract class LoginState {
  String phone;
}

class InitialLogin extends LoginState {}

class LoginSuccess extends LoginState {
  bool value;
  CheckUser checkUser;

  LoginSuccess(this.value, this.checkUser);
}

class LoginError extends LoginState {
  final String oError;

  LoginError(this.oError);
}

class LoadingLogin extends LoginState {
  LoadingLogin();
}
