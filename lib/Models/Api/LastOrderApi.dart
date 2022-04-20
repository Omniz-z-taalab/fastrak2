class LastOrderApi {
  Done data;

  LastOrderApi({this.data});

  LastOrderApi.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Done.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Done {
  String id;
  String orderId;
  int type;
  String description;
  PickupAddress pickupAddress;
  PickupAddress deliveryAddress;
  String weight;
  int deliveryTime;
  int hasFragile;
  int numberOfPieces;
  int paymentMethod;
  String moneyCollected;
  String totalShippingFees;
  int status;
  Null returnReason;
  Null clientComment;
  String readyTime;
  int pickupOption;
  int collectedMoneyMethod;
  Null rejectionReason;

  Done(
      {this.id,
        this.orderId,
        this.type,
        this.description,
        this.pickupAddress,
        this.deliveryAddress,
        this.weight,
        this.deliveryTime,
        this.hasFragile,
        this.numberOfPieces,
        this.paymentMethod,
        this.moneyCollected,
        this.totalShippingFees,
        this.status,
        this.returnReason,
        this.clientComment,
        this.readyTime,
        this.pickupOption,
        this.collectedMoneyMethod,
        this.rejectionReason});

  Done.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    type = json['type'];
    description = json['description'];
    pickupAddress = json['pickup_address'] != null
        ? new PickupAddress.fromJson(json['pickup_address'])
        : null;
    deliveryAddress = json['delivery_address'] != null
        ? new PickupAddress.fromJson(json['delivery_address'])
        : null;
    weight = json['weight'];
    deliveryTime = json['delivery_time'];
    hasFragile = json['has_fragile'];
    numberOfPieces = json['number_of_pieces'];
    paymentMethod = json['payment_method'];
    moneyCollected = json['money_collected'];
    totalShippingFees = json['total_shipping_fees'];
    status = json['status'];
    returnReason = json['return_reason'];
    clientComment = json['client_comment'];
    readyTime = json['ready_time'];
    pickupOption = json['pickup_option'];
    collectedMoneyMethod = json['collected_money_method'];
    rejectionReason = json['rejection_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['type'] = this.type;
    data['description'] = this.description;
    if (this.pickupAddress != null) {
      data['pickup_address'] = this.pickupAddress.toJson();
    }
    if (this.deliveryAddress != null) {
      data['delivery_address'] = this.deliveryAddress.toJson();
    }
    data['weight'] = this.weight;
    data['delivery_time'] = this.deliveryTime;
    data['has_fragile'] = this.hasFragile;
    data['number_of_pieces'] = this.numberOfPieces;
    data['payment_method'] = this.paymentMethod;
    data['money_collected'] = this.moneyCollected;
    data['total_shipping_fees'] = this.totalShippingFees;
    data['status'] = this.status;
    data['return_reason'] = this.returnReason;
    data['client_comment'] = this.clientComment;
    data['ready_time'] = this.readyTime;
    data['pickup_option'] = this.pickupOption;
    data['collected_money_method'] = this.collectedMoneyMethod;
    data['rejection_reason'] = this.rejectionReason;
    return data;
  }
}

class PickupAddress {
  String id;
  Null name;
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
  Country country;
  City city;
  Area area;

  PickupAddress(
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

  PickupAddress.fromJson(Map<String, dynamic> json) {
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
    json['country'] != null ? new Country.fromJson(json['country']) : null;
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

class Country {
  String id;
  String name;
  int activation;
  Null phoneCode;
  Null currency;

  Country({this.id, this.name, this.activation, this.phoneCode, this.currency});

  Country.fromJson(Map<String, dynamic> json) {
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