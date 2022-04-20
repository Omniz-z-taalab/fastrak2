import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/ApiPrice.dart';
import 'package:fastrak2/Models/Api/CitiesApi.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/LastOrderApi.dart';
import 'package:fastrak2/Models/Api/PromoCodeApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateRepo{

  static Future<List<Cities>> UserCity() async {
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

    }}

  }
  static Future<List<Areas>> UserAreas() async {
    try{

      Dio.Response response = await dio().get(CITIES);
      print('beforeeeee');
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
  static Future<Data> UserData(   Clintname,  Address,buildingName, Phone, apartment, floorNumber,city,areas) async {
    String Egypt = '5dfbf055-6f48-487f-ad16-1e82b1ac11b9';
    String latitude = '29.983591';
    String longitude = '31.230393';
    int is_hidden = 1;
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
 static Future<Coast>priceData( type, indexx, hasinsurance, weight, Collect, promoCode) async {
    print('qooooowowowowowowo');
      Dio.Response response = await dio().get(SHIPMENTDETAILS,queryParameters: {
        'type':type,
        'delivery_time':indexx ,
        'has_insurance': hasinsurance,
        'weight': weight,
        'money_collected': Collect,
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
  static Future<LastOrderApi>Last(type,pickupId,dileveryId,weight,hasinsurance,numberofpice,payment,Discription,Collect,ispospayment,pickupOption,readytime,hasfragile,Index) async {
    try{
      print('deliveryTime' + '$Index' + 'type' + '$type' + 'pickup' + '$pickupId' + 'deliver' + '$dileveryId' 'weight' '$weight' 'hasinsurance' '$hasinsurance' 'numberofpice' '$numberofpice' 'payment' '$payment' 'Discription' '$Discription' 'Collect' '$Collect' 'ispospayment' ' $ispospayment' 'pickupOption' '$pickupOption' 'readytime' '$readytime'
      'hasfragile' '$hasfragile' 'Index' '$Index');
    Dio.Response response = await dio().post(DoneOrder, data: {
      'type':type,
      'delivery_time':Index,
      'has_insurance': hasinsurance,
      'weight': weight,
      'money_collected': Collect,
      'is_pos_payment': false,
      'pickup_option': pickupOption,
      'ready_time' : readytime,
      'description':Discription,
      'number_of_pieces': numberofpice,
      'payment_method': payment,
      'has_fragile': true,
      'pickup_address_id' : pickupId,
      'delivery_address_id': dileveryId,

    });
    print('zayed' + response.statusCode.toString());
    if (response.statusCode == 200) {
      LastOrderApi userr = LastOrderApi.fromJson(response.data['data']);
      // print(userr.data.weight.toString() + '2222222222222');
      print('hager ');

      print('safwat');
      return userr;

    }
  } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.message);
        print('gggggg');
    }}}

}