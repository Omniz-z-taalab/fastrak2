class CitiesApi {
  List<DataCity> data;

  CitiesApi({this.data});

  CitiesApi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataCity>[];
      json['data'].forEach((v) {
        data.add(new DataCity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCity {
  String id;
  String name;
  int activation;
  Null phoneCode;
  Null currency;
  List<Cities> cities;

  DataCity(
      {this.id,
        this.name,
        this.activation,
        this.phoneCode,
        this.currency,
        this.cities});

  DataCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    activation = json['activation'];
    phoneCode = json['phone_code'];
    currency = json['currency'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['activation'] = this.activation;
    data['phone_code'] = this.phoneCode;
    data['currency'] = this.currency;
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String id;
  String name;
  bool isInsideCity;
  List<Areas> areas;

  Cities({this.id, this.name, this.isInsideCity, this.areas});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isInsideCity = json['is_inside_city'];
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_inside_city'] = this.isInsideCity;
    if (this.areas != null) {
      data['areas'] = this.areas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  String id;
  String name;

  Areas({this.id, this.name});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }}