class TestQuestionsData {
  Data? data;

  TestQuestionsData({this.data});

  TestQuestionsData.fromJson(Map<String, dynamic> json) {
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
  int? ord;
  String? questionText;
  List<Choices>? choices;

  Data({this.id, this.ord, this.questionText, this.choices});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ord = json['ord'];
    questionText = json['questionText'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(new Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ord'] = this.ord;
    data['questionText'] = this.questionText;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choices {
  int? id;
  String? label;
  String? value;
  int? ord;

  Choices({this.id, this.label, this.value, this.ord});

  Choices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    value = json['value'];
    ord = json['ord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['value'] = this.value;
    data['ord'] = this.ord;
    return data;
  }
}
