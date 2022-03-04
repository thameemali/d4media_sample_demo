class LoginResponse {
  bool? status;
  String? message;
  Result? result;

  LoginResponse({this.status, this.message, this.result});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? tokenType;
  int? userId;
  String? userName;
  String? profileImage;
  String? email;
  int? locationId;
  String? locationName;
  int? registrationStatusId;
  String? registrationStatus;
  String? accessToken;
  int? roleId;
  Null? userDesignation;
  String? msg;

  Result(
      {this.tokenType,
        this.userId,
        this.userName,
        this.profileImage,
        this.email,
        this.locationId,
        this.locationName,
        this.registrationStatusId,
        this.registrationStatus,
        this.accessToken,
        this.roleId,
        this.userDesignation,
        this.msg});

  Result.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    userId = json['user_id'];
    userName = json['user_name'];
    profileImage = json['profile_image'];
    email = json['email'];
    locationId = json['location_id'];
    locationName = json['location_name'];
    registrationStatusId = json['registration_status_id'];
    registrationStatus = json['registration_status'];
    accessToken = json['access_token'];
    roleId = json['role_id'];
    userDesignation = json['user_designation'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['profile_image'] = this.profileImage;
    data['email'] = this.email;
    data['location_id'] = this.locationId;
    data['location_name'] = this.locationName;
    data['registration_status_id'] = this.registrationStatusId;
    data['registration_status'] = this.registrationStatus;
    data['access_token'] = this.accessToken;
    data['role_id'] = this.roleId;
    data['user_designation'] = this.userDesignation;
    data['msg'] = this.msg;
    return data;
  }
}
