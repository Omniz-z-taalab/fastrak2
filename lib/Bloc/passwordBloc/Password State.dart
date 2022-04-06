

import 'package:equatable/equatable.dart';
import 'package:fastrak2/Models/Api/passwodApi.dart';

class PasswordState extends Equatable{
  String password;

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class initialState extends PasswordState{
}
class PasswordSuc extends PasswordState{
passwordApi value;
PasswordSuc(this.value){
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
