class CheckUser {
  Data data;

  CheckUser({this.data});

  CheckUser.fromJson(Map<String, dynamic> json) {
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
  bool isExist;

  Data({this.isExist});

  Data.fromJson(Map<String, dynamic> json) {
    isExist = json['is_exist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_exist'] = this.isExist;
    return data;
  }
}
