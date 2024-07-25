class ResultModel2 {
  int? score;
  String? label;
  String? description;

  ResultModel2({this.score, this.label, this.description});

  ResultModel2.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    label = json['label'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['label'] = this.label;
    data['description'] = this.description;
    return data;
  }
}
