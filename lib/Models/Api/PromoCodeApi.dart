class PromoCodeApi {
  Code code;

  PromoCodeApi({this.code});

  PromoCodeApi.fromJson(Map<String, dynamic> json) {
    code = json['data'] != null ? new Code.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.code != null) {
      data['data'] = this.code.toJson();
    }
    return data;
  }
}

class Code {
  bool status;

  Code({this.status});

  Code.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}