part of 'scond_user_order_bloc.dart';

@immutable
abstract class DropOfOrderState {}

class ScondUserOrderInitial extends DropOfOrderState {}

class DropOfOrderUser extends DropOfOrderState{

}

class ErrorSecondUserState extends DropOfOrderState{
  String ctch;
  ErrorSecondUserState(this.ctch);

}
class SuccessSecondUser extends DropOfOrderState{
  Data value;
  SuccessSecondUser(this.value){
    print('Ashhhhhhhhrakaaaaaaat');
  }
}
class LoadingSecondUser extends DropOfOrderState {
}