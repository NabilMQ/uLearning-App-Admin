
import 'package:ulearning_app_admin/utils/entities/user_list.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';

class UserListStates {
  UserListStates({
    this.userList,
    this.apiStatus = ApiStatus.idle,
  });

  final UserList? userList;
  final ApiStatus apiStatus;

  UserListStates copyWith({
    UserList? userList,
    ApiStatus? apiStatus
  }) {
    return UserListStates(
      userList: userList ?? this.userList,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }
}