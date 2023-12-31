class AboutModel {
  final int? id;
  final String? title;
  final String? description;

  AboutModel({
    this.id,
    this.title,
    this.description,
  });

  AboutModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'description': description};
}
