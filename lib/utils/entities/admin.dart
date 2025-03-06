import 'dart:convert';

class AdminAccount {

  AdminAccount({
    this.name,
    this.email,
    this.password,
    this.avatar,
    this.type,
    this.openId,
  });

  String? name;
  String? email;
  String? password;
  String? avatar;
  String? type;
  String? openId;

  factory AdminAccount.fromResponse(String response) {

    var temp = jsonDecode(response);

    return AdminAccount(
      name: temp["data"]["name"],
      email: temp["data"]["email"],
      password: temp["data"]["password"],
      avatar: temp["data"]["avatar"],
      type: temp["data"]["type"].toString(),
      openId: temp["data"]["open_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "avatar": avatar,
    "type": type,
    "open_id": openId,
  };
}