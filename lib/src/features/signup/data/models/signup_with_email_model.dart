class SignUpWithEmailModel {
  bool? success;
  String? error;

  SignUpWithEmailModel({this.success, this.error});

  SignUpWithEmailModel.fromJson(Map<String, dynamic> json) {
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
