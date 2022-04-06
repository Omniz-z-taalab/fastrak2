import 'package:bloc/bloc.dart';
import 'package:fastrak2/Bloc/LoginBloc/LoginEvent.dart';
import 'package:fastrak2/Bloc/LoginBloc/LoginRepo.dart';
import 'package:fastrak2/Bloc/LoginBloc/LoginStates.dart';
import 'package:fastrak2/Bloc/passwordBloc/AuthenticationRepo.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/checkuser.dart';
import 'package:fastrak2/loading/loading.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String phonee;
  AuthenticationRepo authenticationRepo;
  CheckUser checkUser;

  LoginBloc() : super(InitialLogin());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is CheeckUser) {
      emit(LoadingLogin());
      phonee = event.phone;
      LoginBlocMethod();
    }


  }

  void LoginBlocMethod() {
    Future<bool> response = AuthenticationRepo.LoginMethod(phonee, checkUser);
    response.then((value) {
      emit(LoginSuccess(value, checkUser));
    }).catchError((onError) {
    ApiError oError = ApiError.fromJson(onError);
    emit(LoginError(oError.toString()));
    });
  }
}
