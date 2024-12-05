class GetProfile {
  Result? result;
  String? message;
  String? status;

  GetProfile({this.result, this.message, this.status});

  GetProfile.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Result {
  String? id;
  String? companyId;
  String? companyPin;
  String? firstName;
  String? lastName;
  String? userName;
  String? mobile;
  String? email;
  String? password;
  String? image;
  String? document;
  String? type;
  String? cif;
  String? position;
  String? direction;
  String? contact;
  String? socialId;
  String? lat;
  String? lon;
  String? address;
  String? registerId;
  String? iosRegisterId;
  String? status;
  String? dateTime;

  Result(
      {this.id,
        this.companyId,
        this.companyPin,
        this.firstName,
        this.lastName,
        this.userName,
        this.mobile,
        this.email,
        this.password,
        this.image,
        this.document,
        this.type,
        this.cif,
        this.position,
        this.direction,
        this.contact,
        this.socialId,
        this.lat,
        this.lon,
        this.address,
        this.registerId,
        this.iosRegisterId,
        this.status,
        this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    companyPin = json['company_pin'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    document = json['document'];
    type = json['type'];
    cif = json['cif'];
    position = json['position'];
    direction = json['direction'];
    contact = json['contact'];
    socialId = json['social_id'];
    lat = json['lat'];
    lon = json['lon'];
    address = json['address'];
    registerId = json['register_id'];
    iosRegisterId = json['ios_register_id'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['company_pin'] = this.companyPin;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    data['document'] = this.document;
    data['type'] = this.type;
    data['cif'] = this.cif;
    data['position'] = this.position;
    data['direction'] = this.direction;
    data['contact'] = this.contact;
    data['social_id'] = this.socialId;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['address'] = this.address;
    data['register_id'] = this.registerId;
    data['ios_register_id'] = this.iosRegisterId;
    data['status'] = this.status;
    data['date_time'] = this.dateTime;
    return data;
  }
}