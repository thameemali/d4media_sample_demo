class ResendOtpResponse {
  bool? status;
  String? message;
  Result? result;

  ResendOtpResponse({this.status, this.message, this.result});

  ResendOtpResponse.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['otp'] = this.otp;
    data['msg'] = this.msg;
    return data;
  }
}
