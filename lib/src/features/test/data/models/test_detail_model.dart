class TestDetailModel {
  Data? data;

  TestDetailModel({this.data});

  TestDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Image1? image;
  String? type;
  String? description;
  int? questionsCount;
  int? testTaken;
  Results? results;

  Data(
      {this.id,
      this.name,
      this.image,
      this.type,
      this.description,
      this.questionsCount,
      this.testTaken,
      this.results});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? new Image1.fromJson(json['image']) : null;
    type = json['type'];
    description = json['description'];
    questionsCount = json['questionsCount'];
    testTaken = json['testTaken'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['type'] = this.type;
    data['description'] = this.description;
    data['questionsCount'] = this.questionsCount;
    data['testTaken'] = this.testTaken;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
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

class Results {
  int? hcR;
  int? hcI;
  int? hcA;
  int? hcS;
  int? hcE;
  int? hcC;
  String? rlabel;
  String? rdescr;
  String? ilabel;
  String? idescr;
  String? alabel;
  String? adescr;
  String? slabel;
  String? sdescr;
  String? elabel;
  String? edescr;
  String? clabel;
  String? cdescr;

  Results(
      {this.hcR,
      this.hcI,
      this.hcA,
      this.hcS,
      this.hcE,
      this.hcC,
      this.rlabel,
      this.rdescr,
      this.ilabel,
      this.idescr,
      this.alabel,
      this.adescr,
      this.slabel,
      this.sdescr,
      this.elabel,
      this.edescr,
      this.clabel,
      this.cdescr});

  Results.fromJson(Map<String, dynamic> json) {
    hcR = json['hcR'];
    hcI = json['hcI'];
    hcA = json['hcA'];
    hcS = json['hcS'];
    hcE = json['hcE'];
    hcC = json['hcC'];
    rlabel = json['Rlabel'];
    rdescr = json['Rdescr'];
    ilabel = json['Ilabel'];
    idescr = json['Idescr'];
    alabel = json['Alabel'];
    adescr = json['Adescr'];
    slabel = json['Slabel'];
    sdescr = json['Sdescr'];
    elabel = json['Elabel'];
    edescr = json['Edescr'];
    clabel = json['Clabel'];
    cdescr = json['Cdescr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hcR'] = this.hcR;
    data['hcI'] = this.hcI;
    data['hcA'] = this.hcA;
    data['hcS'] = this.hcS;
    data['hcE'] = this.hcE;
    data['hcC'] = this.hcC;
    data['Rlabel'] = this.rlabel;
    data['Rdescr'] = this.rdescr;
    data['Ilabel'] = this.ilabel;
    data['Idescr'] = this.idescr;
    data['Alabel'] = this.alabel;
    data['Adescr'] = this.adescr;
    data['Slabel'] = this.slabel;
    data['Sdescr'] = this.sdescr;
    data['Elabel'] = this.elabel;
    data['Edescr'] = this.edescr;
    data['Clabel'] = this.clabel;
    data['Cdescr'] = this.cdescr;
    return data;
  }
}
