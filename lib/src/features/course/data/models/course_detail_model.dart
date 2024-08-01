class CourseDetailData {
  CourseeData? data;

  CourseDetailData({this.data});

  CourseDetailData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CourseeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CourseeData {
  int? id;
  String? name;
  Image1? image;
  int? fee;
  double? rating;
  int? reviewCount;
  List<Courseoutlineitems>? courseoutlineitems;

  CourseeData(
      {this.id,
      this.name,
      this.image,
      this.fee,
      this.rating,
      this.reviewCount,
      this.courseoutlineitems});

  CourseeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? new Image1.fromJson(json['image']) : null;
    fee = json['fee'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
    if (json['courseoutlineitems'] != null) {
      courseoutlineitems = <Courseoutlineitems>[];
      json['courseoutlineitems'].forEach((v) {
        courseoutlineitems!.add(new Courseoutlineitems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['fee'] = this.fee;
    data['rating'] = this.rating;
    data['reviewCount'] = this.reviewCount;
    if (this.courseoutlineitems != null) {
      data['courseoutlineitems'] =
          this.courseoutlineitems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image1 {
  String? url;
  String? name;
  String? type;

  Image1({this.url, this.name, this.type});

  Image1.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}

class Courseoutlineitems {
  int? id;
  String? title;
  String? description;
  int? courseId;

  Courseoutlineitems({this.id, this.title, this.description, this.courseId});

  Courseoutlineitems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['courseId'] = this.courseId;
    return data;
  }
}

class Errors {
  String? value;
  String? msg;
  String? param;
  String? location;

  Errors({this.value, this.msg, this.param, this.location});

  Errors.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['msg'] = msg;
    data['param'] = param;
    data['location'] = location;
    return data;
  }
}
