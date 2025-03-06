class CourseType {

  CourseType({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.count = 0,
  });

  String? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  int count;

  factory CourseType.fromJson(Map <String, dynamic> json) {

    return CourseType(
      id: json["id"].toString(),
      title: json["title"] ?? "-",
      description: json["description"] ?? "-",
      count: json["count"] ?? 0,
      createdAt: json["created_at"] ?? "-",
      updatedAt: json["updated_at"] ?? "-",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "count": count,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}