class RegisterApi {
  Data data;

  RegisterApi({this.data});

  RegisterApi.fromJson(Map<String, dynamic> json) {
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
  String firstName;
  String lastName;
  Null companyName;
  String phone;
  Null email;
  Null socialType;
  Null socialId;
  int type;
  int isBusiness;
  bool hasPassword;
  int activationStatus;
  bool isInvoiceable;
  String accessToken;
  bool hasNotification;
  Null profilePicture;
  Null bankAccount;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.companyName,
        this.phone,
        this.email,
        this.socialType,
        this.socialId,
        this.type,
        this.isBusiness,
        this.hasPassword,
        this.activationStatus,
        this.isInvoiceable,
        this.accessToken,
        this.hasNotification,
        this.profilePicture,
        this.bankAccount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    phone = json['phone'];
    email = json['email'];
    socialType = json['social_type'];
    socialId = json['social_id'];
    type = json['type'];
    isBusiness = json['is_business'];
    hasPassword = json['has_password'];
    activationStatus = json['activation_status'];
    isInvoiceable = json['is_invoiceable'];
    accessToken = json['access_token'];
    hasNotification = json['has_notification'];
    profilePicture = json['profile_picture'];
    bankAccount = json['bank_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company_name'] = this.companyName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['social_type'] = this.socialType;
    data['social_id'] = this.socialId;
    data['type'] = this.type;
    data['is_business'] = this.isBusiness;
    data['has_password'] = this.hasPassword;
    data['activation_status'] = this.activationStatus;
    data['is_invoiceable'] = this.isInvoiceable;
    data['access_token'] = this.accessToken;
    data['has_notification'] = this.hasNotification;
    data['profile_picture'] = this.profilePicture;
    data['bank_account'] = this.bankAccount;
    return data;
  }
}