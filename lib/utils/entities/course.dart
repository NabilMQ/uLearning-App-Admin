class Course {

  Course({
    this.name,
    this.description,
    this.thumbnail,
    this.lessonLength,
    this.videoLength,
    this.price,
    this.follow,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.downloadableResources,
    this.type,
  });

  String? name;
  String? description;
  String? thumbnail;
  String? lessonLength;
  String? videoLength;
  String? price;
  String? follow;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? downloadableResources;
  String? type;

  factory Course.fromJson(Map <String, dynamic> json) {
    return Course(
      name: json["name"] ?? "-",
      description: json["description"]  ?? "-",
      thumbnail: json["thumbnail"] ?? "-",
      lessonLength: json["lesson_length"] != null
        ? json["lesson_length"].toString()
        : "-",
      videoLength: json["video_length"] != null
        ? json["video_length"].toString()
        : "-",
      price: json["price"] ?? "-",
      follow: json["follow"] != null
        ? json["follow"].toString()
        : "-",
      id: json["id"] != null 
        ? json["id"].toString()
        : "-",
      createdAt: json["created_at"] ?? "-",
      updatedAt: json["updated_at"] ?? "-",
      downloadableResources: json["downloadable_resources"] != null
        ? json["downloadable_resources"].toString()
        : "-",
      type: json["type"]["title"] ?? "-",
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "lessonLength": lessonLength,
    "videoLength": videoLength,
    "price": price,
    "follow": follow,
    "id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "downloadableResources": downloadableResources,
    "type": type,
  };
}