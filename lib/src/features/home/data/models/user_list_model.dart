class UserListModel {
  bool? success;
  String? error;
  Data? data;

  UserListModel({this.success, this.data});

  UserListModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? email;
  AvatarUrl? avatarUrl;
  String? username;
  String? fullName;

  Data({this.id, this.email, this.avatarUrl, this.username, this.fullName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    avatarUrl = json['avatarUrl'] != null
        ? new AvatarUrl.fromJson(json['avatarUrl'])
        : null;
    username = json['username'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    if (this.avatarUrl != null) {
      data['avatarUrl'] = this.avatarUrl!.toJson();
    }
    data['username'] = this.username;
    data['fullName'] = this.fullName;
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
