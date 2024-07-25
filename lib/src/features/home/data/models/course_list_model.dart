class CourseListModel {
  List<CourseData> data = [];

  // CourseListModel({this.data});

  CourseListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CourseData>[];
      json['data'].forEach((v) {
        data!.add(new CourseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseData {
  int? id;
  String? name;
  Image1? image;
  int? fee;
  double? rating;
  int? reviewCount;

  CourseData(
      {this.id,
      this.name,
      this.image,
      this.fee,
      this.rating,
      this.reviewCount});

  CourseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? new Image1.fromJson(json['image']) : null;
    fee = json['fee'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
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

  static asset(String s, {required double height, required double width}) {}
}
