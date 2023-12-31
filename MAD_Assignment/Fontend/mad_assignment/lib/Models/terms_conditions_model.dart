class TermsConditionsModel {
  int? id;
  String? title;
  String? description;

  TermsConditionsModel({this.id, this.title, this.description});

  TermsConditionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
