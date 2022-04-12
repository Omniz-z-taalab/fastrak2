import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/ApiPrice.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/PromoCodeApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateRepo{

  static Future<Data> UserData(   Clintname,  Address,buildingName, Phone, apartment, floorNumber) async {
    String Egypt = '5dfbf055-6f48-487f-ad16-1e82b1ac11b9';
    String City = '9496194a-28d7-4edd-9d7e-9e6fa747396b';
    String area = '094ABB8D-EC26-48ED-B1A0-1496456439C2';
    String latitude = '29.983591';
    String longitude = '31.230393';
    int is_hidden = 1;
    print('wwwwwwwwwwwwwwwwwwww');
    try{

    Dio.Response response = await dio().post( CREATEORDER, data: {
        "name": Clintname,
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
      });
      print('ggggggggggggggggg');
      Data model = Data.fromJson(response.data['data']);
      print(model.phone);

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
 static Future<Coast>priceData(type,deliverytime,hasinsurance,weight,monycollected,promoCode) async {
    print("type " + type + "deliverytime" + deliverytime + "hasinsurance" +
        "hasinsurance" + hasinsurance + "weight"+ weight + "monycollected" + monycollected);
      Dio.Response response = await dio().get(SHIPMENTDETAILS,queryParameters: {
        'type':type,
        'delivery_time':deliverytime,
        'has_insurance': hasinsurance,
        'weight': weight,
        'money_collected': monycollected,
        'promocode': promoCode
      });
      print('zayed' + response.statusCode.toString());
      if (response.statusCode == 200) {
        print(response.data.toString());
        Coast userr = Coast.fromJson(response.data['data']);
        print(userr.shippingFees.toString() + '2222222222222');
        print('hager ');

        print('safwat');
        return userr;

      }
  }
  static Future<PromoCodeApi> Promo(promoCode,type,deliverytime,hasinsurance,weight,moneycollected) async {
print(promoCode.toString());
print(type + deliverytime + moneycollected + promoCode);

    print('omnia');
      Dio.Response response = await dio().get(PROMOCODE,queryParameters: {'promocode': promoCode});
      print('upppupupupupupupupupupupupupup');
        PromoCodeApi userr = PromoCodeApi.fromJson(response.data['data']);
        return userr;

  }

}