class RegisterResponse {
  bool? status;
  String? message;
  Result? result;

  RegisterResponse({this.status, this.message, this.result});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? otp;
  String? msg;

  Result({this.userId, this.otp, this.msg});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    otp = json['otp'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = this.userId;
    data['otp'] = this.otp;
    data['msg'] = this.msg;
    return data;
  }
}
