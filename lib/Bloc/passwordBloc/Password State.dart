

import 'package:fastrak2/Models/Api/passwodApi.dart';

class PasswordState {
  String password;

}
class initialState extends PasswordState{
}
class PasswordSuccess extends PasswordState{
passwordApi value;
PasswordSuccess(this.value){
  print(value.data.firstName);
}
}

class PasswordLoading extends PasswordState{
}

class PasswordErrorr extends PasswordState{
  String ctch;
  PasswordErrorr(this.ctch){
    print(ctch.toString());
    print('eeeeeeeeeeeeeeeeeeeee');
  }
}
