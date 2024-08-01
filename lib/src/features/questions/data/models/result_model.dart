class ResultModel {
  int? hcR;
  int? hcI;
  int? hcA;
  int? hcS;
  int? hcE;
  int? hcC;
  List<String>? interest;
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

  ResultModel(
      {this.hcR,
      this.hcI,
      this.hcA,
      this.hcS,
      this.hcE,
      this.hcC,
      this.interest,
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

  ResultModel.fromJson(Map<String, dynamic> json) {
    hcR = json['hcR'];
    hcI = json['hcI'];
    hcA = json['hcA'];
    hcS = json['hcS'];
    hcE = json['hcE'];
    hcC = json['hcC'];
    interest =
        json['interest'] != null ? List<String>.from(json['interest']) : null;
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
    data['interest'] = this.interest;
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
