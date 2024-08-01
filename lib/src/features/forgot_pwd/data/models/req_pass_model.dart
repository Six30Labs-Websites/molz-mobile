class ReqPwdModel {
  bool? success;
  String? error;

  ReqPwdModel({this.success, this.error});

  ReqPwdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    return data;
  }
}
