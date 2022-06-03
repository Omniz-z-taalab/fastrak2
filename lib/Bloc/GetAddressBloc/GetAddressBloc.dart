import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressEvent.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressRepo.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressState.dart';
import 'package:fastrak2/Models/Api/CitiesApi.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAddressBloc extends Bloc<GetAddressEvent, GetAddressState> {
  GetAddressRepo getAddressRepo;
  String Clintname;
  String buildingName;
  String Address;
  String Phone;
  String apartment;
  String floorNumber;
  Cities cityChange;
  List<Areas> areasOnChange;
  Areas newArea;
  String city;
  String areas;
  int page = 1;
  bool statee ;
  String name;
  GetAddressBloc() : super(InitialAddress()) {
    add(getEvent());
    add(FirstStartAdd());
  }

  @override
  Stream<GetAddressState> mapEventToState(GetAddressEvent event) {
    if(event is FirstStartAdd){
      emit(LoadingLogin());
      GetAdd();
    }
    if(event is startScreenEvent){
      emit(LoadingLogin());
      GetAdd();
    }
    // if (event is EditScreenEvent){
    //   GetAdd();
    // }
    if (event is getEvent) {
      emit(LoadingLogin());
      CitiesMethod();
      print('ssssssssss');
    }
    if (event is AddAddress) {
      print(event.phone);
      Clintname = event.ClintName;
      buildingName = event.BuildingName;
      apartment = event.Apartment;
      Phone = event.phone;
      Address = event.address;
      floorNumber = event.FloorNumber;
      city = event.city.id;
      areas = event.areas.id;
      print('$city + ${areas}');
      print('ddddddddddddddddddpppppspspspsspspspspspspspspsps');
      UserAd();
    }
    if (event is OncityChange) {
      cityChange = event.city;
      areasOnChange = event.city.areas;
      print(cityChange.name);
      emit(ChangeState(cityChange));
    }
    if (event is onAreachange) {
      newArea = event.areas;
      print(newArea.name.toString() + 'xaaaaaaaaaax');
      emit(AreasOnchange(newArea));

  }
  }

  GetAdd() {
    print('zaaaaaaaaaaaaaaaaaayed');
    Future<List<UserAddress>> response = GetAddressRepo.User();
    response.then((value) {
      print('loooool');
      print(value.last.name);
        emit(SuccessAddressState(value));
     })
      .catchError((onError) {
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print(ctch.errors.first.message);
        // emit((ctch.errors.first.message));
      }
    });
  }

  void UserAd() {
    Future<AdressUser> response = GetAddressRepo.UserInfo(
        Clintname, buildingName, Address, Phone, apartment, floorNumber,city,areas);
    response.then((value) {
      print(value.name);
      print('errrrrrrrror');
      emit(SucessAdd(value));
    }).catchError((onError) {
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print(ctch.errors.first.message);
        // emit(ErrorState(ctch.errors.first.message));
      }
    });
  }
  CitiesMethod() {
    Future<List<Cities>> response = GetAddressRepo.UsersCity();
    response.then((data) {
      print('omniaaaZayeeeeeed');
      emit(SuccessAddState(data));

    }).catchError((onError){
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print('hhhhhhhhhhhhhhhhhhh');

        print(ctch.errors.last.message);
        // emit(ErrorSecondUserState(ctch.errors.first.message));
      }});
  }
  AreasMethod() {
    Future<List<Areas>> response = GetAddressRepo.UserAreas();
    response.then((aree) {

      print('ppppppp22p2p2p22p2p2p2p2p2p2p');
      print(aree.first.name.toString());
      print('########################################');

      emit(AreaseSuccesss(aree));

    }).catchError((onError){
      if (onError is DioError) {
        ApiError ctch = ApiError.fromJson(onError.response.data);
        print('hhhhhhhhhhhhhhhhhhh');

        print(ctch.errors.last.message);
        // emit(ErrorSecondUserState(ctch.errors.first.message));
      }});
  }
}
