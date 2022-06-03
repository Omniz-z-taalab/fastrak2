import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/CitiesApi.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/endpoint.dart';

class GetAddressRepo{
  static Future<List<UserAddress>> User() async {


      Dio.Response response = await dio().get(GetAddress);
      print('ggggggggggggggggg');
      print(response.data['data']['data']);
      List<UserAddress> model = [];
      response.data['data']['data']
          .forEach((user) => model.add(UserAddress.fromJson(user)));
      print('sdsdsdsdsdsdsdsd');
      return model;

  }

  static Future<AdressUser> UserInfo(   Clintname,  Address,buildingName, Phone, apartment, floorNumber,city,areas) async {
    String Egypt = '5dfbf055-6f48-487f-ad16-1e82b1ac11b9';
    String latitude = '29.983591';
    String longitude = '31.230393';
    int is_hidden = 0;
    print('wwwwwwwwwwwwwwwwwwww');
    try{
      Dio.Response response = await dio().post( CREATEORDER, data: {
        "name": Clintname,
        'country_id': Egypt,
        'city_id': city,
        'area_id': areas,
        "address": Address,
        "latitude": latitude,
        "longitude": longitude,
        "phone": Phone,
        "is_hidden": is_hidden,
        "building_number": buildingName,
        "floor_number": floorNumber,
        "apartment_number": apartment,
      });
      print('ggggggggggggggggg');
      AdressUser model = AdressUser.fromJson(response.data['data']);
      print(model.phone);
      print(model.name + 'QQQQQQQQQQQQQQQQQQQQ');

      return model;

    }
    on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.message);
        print('gggggg');

      }
    }
  }
  static Future<List<Cities>> UsersCity() async {
    try{

      Dio.Response response = await dio().get(CITIES);
      print('beforeeeee');
      print( response.data['data'][0]['cities']
      );
      List<Cities> model = [];
      response.data['data'][0]['cities']
          .forEach((city) => model.add(Cities.fromJson(city)));
      print(model.first.areas.first);
      return model;}
    on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.message);
        print('gggggg');

      }}}
  static Future<List<Areas>> UserAreas() async {
    try{

      Dio.Response response = await dio().get(CITIES);
      print('beforeeee e');
      print( response.data['data'][0]['cities'][0]['areas']
      );
      List<Areas> model = [];
      response.data['data'][0]['cities'][0]['areas']
          .forEach((city) => model.add(Areas.fromJson(city)));

      return model;}
    on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.message);
        print('gggggg');

      }}

  }
}