import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_admin/blocs/userListBloc/user_list_bloc.dart';
import 'package:ulearning_app_admin/blocs/userListBloc/user_list_events.dart';
import 'package:ulearning_app_admin/blocs/userListBloc/user_list_states.dart';
import 'package:ulearning_app_admin/screens/status/error_page.dart';
import 'package:ulearning_app_admin/screens/status/initializing_page.dart';
import 'package:ulearning_app_admin/screens/status/loading_page.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/no_data.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/user/user_table_body.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/user/user_table_head.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  final UserListBloc _userListBloc = UserListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <UserListBloc, UserListStates> (
      bloc: _userListBloc..add(GetUserListEvent()),
      builder: (context, state) {

        if (state.apiStatus == ApiStatus.error) {
          return ErrorPage();
        }
        
        if (state.apiStatus == ApiStatus.processing) {
          return LoadingPage();
        }

        if (state.apiStatus == ApiStatus.idle) {
          return InitializingPage();
        }
        
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "User Data",
                      style: context.textTheme.displaySmall?.apply(
                        color: context.colorScheme.primary
                      ),
                    ),
                  ),
        
                  Column(
                    children: [
                      UserTableHead(),
                  
                      Builder(
                        builder: (context) {
                          if (state.userList == null || state.userList!.users!.isEmpty) {
                            return NoDataWidget();
                          }
                          return Column(
                            children: List.generate(state.userList!.users!.length, (index) {
                              return UserTableBody(
                                user: state.userList!.users!.elementAt(index),
                              );
                            }),
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        );
      }
    );
  }
}