class SetAddressApi {
  Data data;

  SetAddressApi({this.data});

  SetAddressApi.fromJson(Map<String, dynamic> json) {
    print('omniaaaaaaaaaa3');

    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String id;
  String name;
  String phone;
  String buildingNumber;
  String floorNumber;
  String apartmentNumber;
  String address;
  String latitude;
  String longitude;
  int isHidden;
  Null landmark;
  Null landlineNumber;
  Coountry country;
  City city;
  Area area;

  Data(
      {this.id,
        this.name,
        this.phone,
        this.buildingNumber,
        this.floorNumber,
        this.apartmentNumber,
        this.address,
        this.latitude,
        this.longitude,
        this.isHidden,
        this.landmark,
        this.landlineNumber,
        this.country,
        this.city,
        this.area});

  Data.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    buildingNumber = json['building_number'];
    floorNumber = json['floor_number'];
    apartmentNumber = json['apartment_number'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isHidden = json['is_hidden'];
    landmark = json['landmark'];
    landlineNumber = json['landline_number'];
    country =
    json['country'] != null ? new Coountry.fromJson(json['country']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['building_number'] = this.buildingNumber;
    data['floor_number'] = this.floorNumber;
    data['apartment_number'] = this.apartmentNumber;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_hidden'] = this.isHidden;
    data['landmark'] = this.landmark;
    data['landline_number'] = this.landlineNumber;
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area.toJson();
    }
    return data;
  }
}

class Coountry {
  String id;
  String name;
  int activation;
  Null phoneCode;
  Null currency;

  Coountry({this.id, this.name, this.activation, this.phoneCode, this.currency});

  Coountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    activation = json['activation'];
    phoneCode = json['phone_code'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['activation'] = this.activation;
    data['phone_code'] = this.phoneCode;
    data['currency'] = this.currency;
    return data;
  }
}

class City {
  String id;
  String name;
  bool isInsideCity;

  City({this.id, this.name, this.isInsideCity});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isInsideCity = json['is_inside_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_inside_city'] = this.isInsideCity;
    return data;
  }
}

class Area {
  String id;
  String name;

  Area({this.id, this.name});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}