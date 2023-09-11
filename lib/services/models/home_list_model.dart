// ignore_for_file: unnecessary_this, unnecessary_new

class HomeListItems {
  List<Result>? result;
  String? message;
  String? status;

  HomeListItems({this.result, this.message, this.status});

  HomeListItems.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Result {
  String? id;
  String? type;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? country;
  String? password;
  String? registerId;
  String? dateTime;
  String? userName;
  String? dob;
  String? image;
  String? socialId;
  String? status;
  String? token;
  String? expiredAt;
  String? lastLogin;
  Null? iosRegisterId;
  String? lat;
  String? lon;
  String? address;
  String? city;
  String? step;
  String? gender;
  String? establishmentNo;
  String? lang;
  String? typeId;
  String? town;
  String? objectName;
  String? qrImage;
  String? qrCode;
  String? rewardsPoint;
  String? prQrcodeStatus;
  String? prQrcodePoint;

  Result(
      {this.id,
      this.type,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.country,
      this.password,
      this.registerId,
      this.dateTime,
      this.userName,
      this.dob,
      this.image,
      this.socialId,
      this.status,
      this.token,
      this.expiredAt,
      this.lastLogin,
      this.iosRegisterId,
      this.lat,
      this.lon,
      this.address,
      this.city,
      this.step,
      this.gender,
      this.establishmentNo,
      this.lang,
      this.typeId,
      this.town,
      this.objectName,
      this.qrImage,
      this.qrCode,
      this.rewardsPoint,
      this.prQrcodeStatus,
      this.prQrcodePoint});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    country = json['country'];
    password = json['password'];
    registerId = json['register_id'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    dob = json['dob'];
    image = json['image'];
    socialId = json['social_id'];
    status = json['status'];
    token = json['token'];
    expiredAt = json['expired_at'];
    lastLogin = json['last_login'];
    iosRegisterId = json['ios_register_id'];
    lat = json['lat'];
    lon = json['lon'];
    address = json['address'];
    city = json['city'];
    step = json['step'];
    gender = json['gender'];
    establishmentNo = json['establishment_no'];
    lang = json['lang'];
    typeId = json['type_id'];
    town = json['town'];
    objectName = json['object_name'];
    qrImage = json['qr_image'];
    qrCode = json['qr_code'];
    rewardsPoint = json['rewards_point'];
    prQrcodeStatus = json['pr_qrcode_status'];
    prQrcodePoint = json['pr_qrcode_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['country'] = this.country;
    data['password'] = this.password;
    data['register_id'] = this.registerId;
    data['date_time'] = this.dateTime;
    data['user_name'] = this.userName;
    data['dob'] = this.dob;
    data['image'] = this.image;
    data['social_id'] = this.socialId;
    data['status'] = this.status;
    data['token'] = this.token;
    data['expired_at'] = this.expiredAt;
    data['last_login'] = this.lastLogin;
    data['ios_register_id'] = this.iosRegisterId;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['address'] = this.address;
    data['city'] = this.city;
    data['step'] = this.step;
    data['gender'] = this.gender;
    data['establishment_no'] = this.establishmentNo;
    data['lang'] = this.lang;
    data['type_id'] = this.typeId;
    data['town'] = this.town;
    data['object_name'] = this.objectName;
    data['qr_image'] = this.qrImage;
    data['qr_code'] = this.qrCode;
    data['rewards_point'] = this.rewardsPoint;
    data['pr_qrcode_status'] = this.prQrcodeStatus;
    data['pr_qrcode_point'] = this.prQrcodePoint;
    return data;
  }
}
