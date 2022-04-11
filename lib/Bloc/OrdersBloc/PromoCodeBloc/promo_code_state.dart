part of 'promo_code_bloc.dart';

@immutable
abstract class PromoCodeState {}

class PromoCodeInitial extends PromoCodeState {}
class CodeSuccess extends PromoCodeState{
  PromoCodeApi value;
  CodeSuccess(this.value){
    print('lalyyyyyyyy3wn');
  }
}
class CodeErorr extends PromoCodeState{
  String onError;
  CodeErorr(this.onError){
    print(onError);
    print('yaaaaaaaarrrrrrrrrr');
  }
}
class LoadingCode extends PromoCodeState{}