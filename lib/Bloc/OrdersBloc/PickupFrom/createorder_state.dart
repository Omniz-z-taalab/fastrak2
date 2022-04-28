part of 'createorder_bloc.dart';

@immutable
abstract class CreateorderState {}

class CreateorderInitial extends CreateorderState {}


 class ErrorState extends CreateorderState{
  String ctch;
  ErrorState(this.ctch){print(ctch.toString());
  print('ewrwerewrewrewrewrwerewr');}

 }

 class CreateLoadingState extends CreateorderState{}

class SuccessFirstUser extends CreateorderState{

  AdressUser value;
  SuccessFirstUser(this.value){
    print(value.name);
    print('ayyyyyyyy 7aaaaaaagaaaaaaa');
  }
}

class ErrorSecondUserState extends CreateorderState{
  String ctch;
  ErrorSecondUserState(this.ctch);

}

class CheckDataSuccess extends CreateorderState{
  List<Cities> data;
  CheckDataSuccess(this.data);
}
class AreaseSuccess extends CreateorderState{
  List<Areas> aree;
  AreaseSuccess(this.aree);

}
class Changestate extends CreateorderState{
  Cities cityChange;
  Changestate(this.cityChange){
    print(cityChange.toString() + 'ooooooooooooooooooo');
  }
}
class AreasOnChange extends CreateorderState{
  Areas newArea;
  AreasOnChange(this.newArea);
}