class OtpResponse {
  bool? status;
  String? message;
  Result? result;

  OtpResponse({this.status, this.message, this.result});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ?  Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
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
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['token_type'] = tokenType;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['profile_image'] = profileImage;
    data['email'] = email;
    data['location_id'] = locationId;
    data['location_name'] = locationName;
    data['registration_status_id'] = registrationStatusId;
    data['registration_status'] = registrationStatus;
    data['access_token'] = accessToken;
    data['role_id'] = roleId;
    data['msg'] = msg;
    return data;
  }
}
