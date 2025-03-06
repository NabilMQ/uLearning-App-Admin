import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_admin/blocs/userListBloc/user_list_events.dart';
import 'package:ulearning_app_admin/blocs/userListBloc/user_list_states.dart';
import 'package:ulearning_app_admin/utils/api/user_api.dart';
import 'package:ulearning_app_admin/utils/constants/global.dart';
import 'package:ulearning_app_admin/utils/entities/user_list.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';

class UserListBloc extends Bloc <UserListEvents, UserListStates> {
  UserListBloc() : super(UserListStates()) {
    on <GetUserListEvent> ((event, emit) async {
      emit(
        state.copyWith(
          apiStatus: ApiStatus.processing,
        )
      );
      
      try { 
        String response = await UserAPI.getListUser(Global.storageService.getUserToken());

        if (response == "Something went wrong" || jsonDecode(response)["code"] != 200) {
          throw "Error";
        }

        emit(
          state.copyWith(
            userList: UserList.fromJson(jsonDecode(response)),
            apiStatus: ApiStatus.success,
          )
        );
      }
      catch (e) {
        emit(
          state.copyWith(
            apiStatus: ApiStatus.error,
          )
        );
      }
    });
  }
}