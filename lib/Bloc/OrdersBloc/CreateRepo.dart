import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/endpoint.dart';

class CreateRepo{

  static Future<Data> UserData(   Clintname, buildingName, Address, Phone, apartment, floorNumber) async {
    String Egypt = '5dfbf055-6f48-487f-ad16-1e82b1ac11b9';
    String City = '9496194a-28d7-4edd-9d7e-9e6fa747396b';
    String area = '094ABB8D-EC26-48ED-B1A0-1496456439C2';
    String latitude = '29.983591';
    String longitude = '31.230393';
    int is_hidden = 1;
    print('wwwwwwwwwwwwwwwwwwww');
    try{
      Dio.Response response = await dio().post( CREATEORDER, data: {
        'country_id': Egypt,
        'city_id': City,
        'area_id': area,
        "address": Address,
        "latitude": latitude,
        "longitude": longitude,
        "phone": Phone,
        "is_hidden": is_hidden,
        "building_number": buildingName,
        "floor_number": floorNumber,
        "apartment_number": apartment,
        "name": Clintname,
      });
      print('ggggggggggggggggg');
      Data model = Data.fromJson(response.data['data']);
      print(model.phone);
        // widget.firstUser = model  ;
        // print('22222222222222222');
        // print(widget.firstUser.name);
        // Navigator.pop(context, widget.firstUser);
      return model;

    }
    on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.message);
        print('gggggg');
        // ApiError errorr = ApiError.fromJson(e.response.data);
        // print(errorr.errors[0].message);
        // Fluttertoast.showToast(
        //     msg: '${errorr.errors[0].message}',
        //     textColor: Colors.white,
        //     backgroundColor: Colors.red);
      }
    }
  }

}