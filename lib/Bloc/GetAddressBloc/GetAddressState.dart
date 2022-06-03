import 'package:fastrak2/Models/Api/CitiesApi.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';

class GetAddressState{}
class nesstate extends GetAddressState{
  bool statee;
  nesstate(this.statee){
    print(statee);
  }
}

class LoadingLogin extends GetAddressState {
  LoadingLogin();
}


class InitialAddress extends GetAddressState{}

class SucessAdd extends GetAddressState{

  AdressUser value;
  SucessAdd(this.value){
    print(value.address.toString() + 'qwerrtttt');
  }
}
class SuccessAddState extends GetAddressState{
  List<Cities> data;
SuccessAddState(this.data);
}
class ChangeCityState extends GetAddressState{
  Cities cityChange;
  ChangeCityState(this.cityChange){
    print(cityChange.toString() + 'ooooooooooooooooooo');
  }
}
class AreaseSuccesss extends GetAddressState{
  List<Areas> aree;
  AreaseSuccesss(this.aree);

}
class ChangeState extends GetAddressState{
  Cities cityChange;
  ChangeState(this.cityChange){
    print(cityChange.toString() + 'ooooooooooooooooooo');
  }
}
class AreasOnchange extends GetAddressState{
  Areas newArea;
  AreasOnchange(this.newArea);
}
class SuccessAddressState extends GetAddressState{
  List<UserAddress> value;
  SuccessAddressState(this.value){
    print(value);
    print('caaaaaar');
  }
}