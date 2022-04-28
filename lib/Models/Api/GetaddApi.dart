class GetAdressAPI {
  Data data;

  GetAdressAPI({this.data});

  GetAdressAPI.fromJson(Map<String, dynamic> json) {
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
  List<UserAddress> data;
  Pagination pagination;

  Data({this.data, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserAddress>[];
      json['data'].forEach((v) {
        data.add(new UserAddress.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class UserAddress {
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
  String landlineNumber;
  Ccountry country;
  Citys city;
  Area area;

  UserAddress(
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

  UserAddress.fromJson(Map<String, dynamic> json) {
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
    json['country'] != null ? new Ccountry.fromJson(json['country']) : null;
    city = json['city'] != null ? new Citys.fromJson(json['city']) : null;
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

class Ccountry {
  String id;
  String name;
  int activation;
  Null phoneCode;
  Null currency;

  Ccountry({this.id, this.name, this.activation, this.phoneCode, this.currency});

  Ccountry.fromJson(Map<String, dynamic> json) {
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

class Citys {
  String id;
  String name;
  bool isInsideCity;

  Citys({this.id, this.name, this.isInsideCity});

  Citys.fromJson(Map<String, dynamic> json) {
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

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;

  Pagination(
      {this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}