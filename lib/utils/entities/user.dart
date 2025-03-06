class User {

  User({
    this.id,
    this.name,
    this.email,
    this.createdAt,
  });

  String? id;
  String? name;
  String? email;
  String? createdAt;

  factory User.fromJson(Map <String, dynamic> json) {

    return User(
      id: json["id"].toString(),
      name: json["name"] ?? "-",
      email: json["email"] ?? "-",
      createdAt: json["created_at"] ?? "-",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "createdAt": createdAt,
  };
}