class passwordApi {
  Data data;

  passwordApi({this.data});

  passwordApi.fromJson(Map<String, dynamic> json) {
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
  String phone;
  String email;
  Null socialType;
  Null socialId;
  int type;
  bool hasPassword;
  int activationStatus;
  String accessToken;
  ProfilePicture profilePicture;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.socialType,
        this.socialId,
        this.type,
        this.hasPassword,
        this.activationStatus,
        this.accessToken,
        this.profilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    socialType = json['social_type'];
    socialId = json['social_id'];
    type = json['type'];
    hasPassword = json['has_password'];
    activationStatus = json['activation_status'];
    accessToken = json['access_token'];
    profilePicture = json['profile_picture'] != null
        ? new ProfilePicture.fromJson(json['profile_picture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['social_type'] = this.socialType;
    data['social_id'] = this.socialId;
    data['type'] = this.type;
    data['has_password'] = this.hasPassword;
    data['activation_status'] = this.activationStatus;
    data['access_token'] = this.accessToken;
    if (this.profilePicture != null) {
      data['profile_picture'] = this.profilePicture.toJson();
    }
    return data;
  }
}

class ProfilePicture {
  int id;
  String path;
  String pathThumbnail;
  String mimeType;
  List<Null> customProperties;

  ProfilePicture(
      {this.id,
        this.path,
        this.pathThumbnail,
        this.mimeType,
        this.customProperties});

  ProfilePicture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    pathThumbnail = json['path_thumbnail'];
    mimeType = json['mime_type'];
    if (json['custom_properties'] != null) {
      customProperties = <Null>[];

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['path_thumbnail'] = this.pathThumbnail;
    data['mime_type'] = this.mimeType;

    return data;
  }
}