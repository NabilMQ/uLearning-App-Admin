import 'package:ulearning_app_admin/utils/entities/user.dart';

class UserList {
  UserList({
    this.users
  });

  List <User>? users;

  factory UserList.fromJson(Map <String, dynamic> json) {

    List <User> temp = List <User>.from(json["data"].map((x) => User.fromJson(x)));
    return UserList(
      users: temp.isEmpty
        ? []
        : temp,
    );
  }
}