class UserProfileDetail {
  String? result;
  // List<Null>? errors;
  UserData? userData;

  // UserProfileDetail({this.result, this.errors, this.data});

  UserProfileDetail.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    // if (json['errors'] != null) {
    //   errors = <Null>[];
    //   json['errors'].forEach((v) {
    //     errors!.add(new Null.fromJson(v));
    //   });
    // }
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    // if (this.errors != null) {
    //   data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    // }
    if (userData != null) {
      data['data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? token;
  UserDetails? userDetails;

  UserData({this.token, this.userDetails});

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userDetails = json['userDetails'] != null
        ? UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (userDetails != null) {
      data['userDetails'] = userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  String? phone;
  List<Role>? role;

  UserDetails({this.id, this.name, this.email, this.phone, this.role});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    if (json['role'] != null) {
      role = <Role>[];
      json['role'].forEach((v) {
        role!.add(Role.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    if (role != null) {
      data['role'] = role!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Role {
  int? roleId;
  String? roleName;

  Role({this.roleId, this.roleName});

  Role.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roleId'] = roleId;
    data['roleName'] = roleName;
    return data;
  }
}
