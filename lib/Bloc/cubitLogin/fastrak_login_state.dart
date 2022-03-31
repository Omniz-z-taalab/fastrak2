part of 'fastrak_login_cubit.dart';

@immutable
abstract class FastrakLoginState {}
class FastrakLoginInitial extends FastrakLoginState {}
class FastrakLoginLoading extends FastrakLoginState {}
class FastrakLoginSuccess extends FastrakLoginState {
  final CheckUser checkUser;
  FastrakLoginSuccess(this.checkUser);
}
class FastrakLoginError extends FastrakLoginState {
  final String error;

  FastrakLoginError(this.error);

}
