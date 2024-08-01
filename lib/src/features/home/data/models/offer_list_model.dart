class OfferListModel {
  List<OfferData>? data = [];

  // OfferListModel({this.data})

  OfferListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OfferData>[];
      json['data'].forEach((v) {
        data!.add(new OfferData.fromJson(v));
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

class OfferData {
  int? id;
  String? title;
  String? description;
  String? linkText;
  String? linkTarget;
  Image1? image;

  OfferData(
      {this.id,
      this.title,
      this.description,
      this.linkText,
      this.linkTarget,
      this.image});

  OfferData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    linkText = json['linkText'];
    linkTarget = json['linkTarget'];
    image = json['image'] != null ? new Image1.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['linkText'] = this.linkText;
    data['linkTarget'] = this.linkTarget;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
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
