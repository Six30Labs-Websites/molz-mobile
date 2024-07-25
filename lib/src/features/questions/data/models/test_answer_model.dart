class TestAnswerModel {
  Data? data;

  TestAnswerModel({this.data});

  TestAnswerModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? questionId;
  int? answerId;
  int? testId;

  Data({this.id, this.userId, this.questionId, this.answerId, this.testId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    questionId = json['questionId'];
    answerId = json['answerId'];
    testId = json['testId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['questionId'] = this.questionId;
    data['answerId'] = this.answerId;
    data['testId'] = this.testId;
    return data;
  }
}
