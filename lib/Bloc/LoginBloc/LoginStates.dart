import 'package:equatable/equatable.dart';
import 'package:fastrak2/Bloc/LoginBloc/LoginRepo.dart';
import 'package:fastrak2/Models/Api/checkuser.dart';
import 'package:fastrak2/Bloc/passwordBloc/password.dart';

abstract class LoginState extends Equatable {
  String phone;

  @override
  List<Object> get props => [];
}

class InitialLogin extends LoginState {}

class LoginSuccess extends LoginState {
  bool value;
  CheckUser checkUser;

  LoginSuccess(this.value, this.checkUser) {
    print( 'eeeeeeeeeeedddddd' + value.toString());
  }
}

class LoginError extends LoginState {
  final String oError;

  LoginError(this.oError);
}

class LoadingLogin extends LoginState {
  LoadingLogin();
}
