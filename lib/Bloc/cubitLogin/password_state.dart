part of 'password_cubit.dart';

@immutable
abstract class FastrakPasswordState {

}

class FastrakPasswordInitial extends FastrakPasswordState {}
class FastrakPasswordLoading extends FastrakPasswordState {}
class FastrakPasswordSuccess extends FastrakPasswordState {
  final passwordApi checkPassword;

  FastrakPasswordSuccess(this.checkPassword);
}

class FastrakPasswordError extends FastrakPasswordState {
  final Error error;

  FastrakPasswordError(this.error);
}
