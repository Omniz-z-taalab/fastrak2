part of 'scond_user_order_bloc.dart';

@immutable
abstract class DropOfOrderState {}

class ScondUserOrderInitial extends DropOfOrderState {}

class DropOfOrderUser extends DropOfOrderState{

}

class CheckDataSuccess extends DropOfOrderState{
  List<Cities> data;
  CheckDataSuccess(this.data);
}


class ErrorSecondUserState extends DropOfOrderState{
  String ctch;
  ErrorSecondUserState(this.ctch);


}
class LoadingSecondUser extends DropOfOrderState {
}
class SuccessSecondUser extends DropOfOrderState{
  Data value;
  SuccessSecondUser(this.value){
    print('Ashhhhhhhhrakaaaaaaat');
  }
}
class Changestate extends DropOfOrderState{
  Cities cityChange;
  List<Areas> areasOnChange;
  Changestate(this.cityChange,this.areasOnChange){
    print(cityChange.toString() + 'ooooooooooooooooooo');
  }
}
class AreasOnChange extends DropOfOrderState{
  Areas newArea;
  AreasOnChange(this.newArea);
}