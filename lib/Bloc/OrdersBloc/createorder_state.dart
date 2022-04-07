part of 'createorder_bloc.dart';

@immutable
abstract class CreateorderState {}

class CreateorderInitial extends CreateorderState {}


 class ErrorState extends CreateorderState{
  String ctch;
  ErrorState(this.ctch);

 }

 class CreateLoadingState extends CreateorderState{}

class OrderSuccess extends CreateorderState{

  Data value;
  OrderSuccess(this.value){
    print(value.name);
    print('ayyyyyyyy 7aaaaaaagaaaaaaa');
  }
}