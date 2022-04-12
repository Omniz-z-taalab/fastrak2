// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:fastrak2/Bloc/OrdersBloc/CreateRepo.dart';
// import 'package:fastrak2/Models/Api/ApiPrice.dart';
// import 'package:fastrak2/Models/Api/Error.dart';
// import 'package:fastrak2/Models/Api/PromoCodeApi.dart';
// import 'package:meta/meta.dart';
//
// part 'promo_code_event.dart';
// part 'promo_code_state.dart';
//
// class PromoCodeBloc extends Bloc<PromoCodeEvent, PromoCodeState> {
//   String code;
//   CreateRepo promo;
//   String promoCode;
//   PromoCodeBloc() : super(PromoCodeInitial()) {}
//
//   @override
//   Stream<PromoCodeState> mapEventToState(PromoCodeEvent event) {
//     if(event is CheckCode){
//       print('lalalalalalalala');
//       print(event.code.toString());
//       promoCode = event.code.toString();
//       PromoCodeMethod();
//     }
//   }
//
//   void PromoCodeMethod() {
//     Future<PromoCodeApi> response = CreateRepo.Promo(promoCode);
//     response.then((value) {
//       print('000000000000000000');
//       emit(CodeSuccess(value));
//     }).catchError((onError){
//         print('1111111111111111111111');
//         if(onError is DioError) {
//           ApiError Error = ApiError.fromJson(onError.response.data);
//           print(Error.errors.first.message);
//           emit(CodeErorr(Error.errors.first.message));
//         } });
//   }
//
// }
