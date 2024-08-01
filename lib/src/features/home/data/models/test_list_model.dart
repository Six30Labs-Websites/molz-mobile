class TestListModel {
  List<TestData>? data = [];

  // GetTestListModel({this.data});

  TestListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TestData>[];
      json['data'].forEach((v) {
        data!.add(new TestData.fromJson(v));
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

class TestData {
  int? id;
  String? name;
  Image1? image;
  String? type;

  TestData({this.id, this.name, this.image, this.type});

  TestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? new Image1.fromJson(json['image']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['type'] = this.type;
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
