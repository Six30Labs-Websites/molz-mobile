class LogInWithEmailModel {
  bool? success;
  String? error;
  Data? data;

  LogInWithEmailModel({this.success, this.data});

  LogInWithEmailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  User? user;

  Data({this.accessToken, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  int? status;
  String? username;
  AvatarUrl? avatarUrl;

  User({this.id, this.email, this.status, this.username, this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    status = json['status'];
    username = json['username'];
    avatarUrl = json['avatarUrl'] != null
        ? new AvatarUrl.fromJson(json['avatarUrl'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['status'] = this.status;
    data['username'] = this.username;
    if (this.avatarUrl != null) {
      data['avatarUrl'] = this.avatarUrl!.toJson();
    }
    return data;
  }
}

class AvatarUrl {
  String? name;
  String? type;
  String? url;

  AvatarUrl({this.name, this.type, this.url});

  AvatarUrl.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
