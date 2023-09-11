// ignore_for_file: unnecessary_this

class AddDataToListModel {
  String? country;
  String? password;
  String? town;
  String? userId;
  String? objectName;
  String? mobile;
  String? lastName;
  String? firstName;
  String? email;
  String? token;

  AddDataToListModel(
      {this.country,
      this.password,
      this.town,
      this.userId,
      this.objectName,
      this.mobile,
      this.lastName,
      this.firstName,
      this.email,
      this.token});

  AddDataToListModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    password = json['password'];
    town = json['town'];
    userId = json['user_id'];
    objectName = json['object_name'];
    mobile = json['mobile'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    email = json['email'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['password'] = this.password;
    data['town'] = this.town;
    data['user_id'] = this.userId;
    data['object_name'] = this.objectName;
    data['mobile'] = this.mobile;
    data['last_name'] = this.lastName;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['Token'] = this.token;
    return data;
  }
}
