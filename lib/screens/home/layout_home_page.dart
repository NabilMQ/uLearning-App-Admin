import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_bloc.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_events.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_states.dart';
import 'package:ulearning_app_admin/blocs/routeBloc/route_bloc.dart';
import 'package:ulearning_app_admin/blocs/routeBloc/route_events.dart';
import 'package:ulearning_app_admin/blocs/routeBloc/route_states.dart';
import 'package:ulearning_app_admin/blocs/themeBloc/theme_bloc.dart';
import 'package:ulearning_app_admin/blocs/themeBloc/theme_states.dart'; 
import 'package:ulearning_app_admin/utils/constants/global.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';
import 'package:ulearning_app_admin/utils/enum/auth.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_alert_dialog.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_error_dialog.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_list_view_drawer_child.dart';
import 'package:web/web.dart' as web;


class LayoutHomePage extends StatefulWidget {
  const LayoutHomePage({
    super.key,
    required this.child,
  });
  
  final Widget child;

  @override
  State<LayoutHomePage> createState() => _LayoutHomePageState();
}

class _LayoutHomePageState extends State<LayoutHomePage> {

  ValueNotifier <double> sideMenuWidth = ValueNotifier <double> (56.0);

  @override
  void initState() {
    if (web.window.location.pathname == "/login") {
      Global.routeBloc.add(
        ChangeEvent(path: "/home")
      );
    }
    else {
      Global.routeBloc.add(
        ChangeEvent(path: web.window.location.pathname)
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.secondary,
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            color: context.colorScheme.onSecondary,
          ),
          onPressed: () {
            if (sideMenuWidth.value == 56.0) {
              sideMenuWidth.value = 300.0;
            }
            else {
              sideMenuWidth.value = 56.0;
            }
          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: context.colorScheme.onSecondary,
            ),
            onPressed: () {
            },
          ),
        ),
        titleSpacing: 8,
      ),
      body: BlocListener <AuthBloc, AuthStates> (
        bloc: Global.authBloc,
        listener: (context, state) {
          if (state.authStatus == AuthStatus.unauthenticated && state.apiStatus == ApiStatus.idle && (Global.storageService.getUserToken() == "" || Global.storageService.getUserToken().isEmpty)) {
            Global.routeBloc.add(
              ChangeEvent(path: "/login")
            );
            context.go("/login");
          }
        },
        child: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: sideMenuWidth,
              builder: (context, value, child) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 56,
                      ),
                      child: widget.child,
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      reverseDuration: Duration(milliseconds: 200),
                      switchInCurve: Curves.fastOutSlowIn,
                      switchOutCurve: Curves.fastOutSlowIn,
                      child: value != 56.0
                        ? GestureDetector(
                          onTap: () {
                            sideMenuWidth.value = 56.0;
                          },
                          child: Container(
                              width: context.screenWidth,
                              height: context.screenHeight,
                              color: Colors.black.withValues(alpha: 0.5),
                            ),
                        )
                        : SizedBox.shrink(),
                    ),
        
                    AnimatedContainer(
                      width: value,
                      height: context.screenHeight,
                      color: context.colorScheme.secondaryContainer,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder <RouteBloc, RouteStates>(
                            bloc: Global.routeBloc,
                            builder: (context, state) {
                              if (state.path == null) {
                                return SizedBox.shrink();
                              }
                              return Expanded(
                                child: ListView(
                                  children: [
                                    CustomListViewDrawerChild(
                                      width: value,
                                      isSelected: state.path!.contains("/home"),
                                      icon: Icon(
                                        Icons.house_outlined,
                                        color: context.colorScheme.onSecondaryContainer,
                                      ),
                                      text: "Home",
                                      onPressed: () async {
                                        Global.routeBloc.add(
                                          ChangeEvent(path: "/home")
                                        );
                                        context.go("/home");
                                      },
                                    ),
                                    CustomListViewDrawerChild(
                                      width: value,
                                      isSelected: state.path!.contains("/courseTypes"),
                                      icon: Icon(
                                        Icons.border_color_outlined,
                                        color: context.colorScheme.onSecondaryContainer,
                                      ),
                                      text: "Course Types",
                                      onPressed: () async {
                                        Global.routeBloc.add(
                                          ChangeEvent(path: "/courseTypes")
                                        );
                                        context.go("/courseTypes");
                                      },
                                    ),
                                    CustomListViewDrawerChild(
                                      width: value,
                                      isSelected: state.path!.contains("/courses"),
                                      icon: Icon(
                                        Icons.book_outlined,
                                        color: context.colorScheme.onSecondaryContainer,
                                      ),
                                      text: "Courses",
                                      onPressed: () {
                                        Global.routeBloc.add(
                                          ChangeEvent(path: "/courses")
                                        );
                                        context.go("/courses");
                                      },
                                    ),
                                    CustomListViewDrawerChild(
                                      width: value,
                                      isSelected: state.path!.contains("/users"),
                                      icon: Icon(
                                        Icons.group_outlined,
                                        color: context.colorScheme.onSecondaryContainer,
                                      ),
                                      text: "Users",
                                      onPressed: () {
                                        Global.routeBloc.add(
                                          ChangeEvent(path: "/users")
                                        );
                                        
                                        context.go("/users");
                                      },
                                    ),  
                                    CustomListViewDrawerChild(
                                      width: value,
                                      isSelected: state.path!.contains("/settings"),
                                      icon: Icon(
                                        Icons.settings_applications_outlined,
                                        color: context.colorScheme.onSecondaryContainer,
                                      ),
                                      text: "Settings",
                                      onPressed: () {
                                        Global.routeBloc.add(
                                          ChangeEvent(path: "/settings")
                                        );
                                        context.go("/settings");
                                      },
                                    ),
                                    CustomListViewDrawerChild(
                                      width: value,
                                      icon: Icon(
                                        Icons.logout_outlined,
                                        color: context.colorScheme.onSecondaryContainer,
                                      ),
                                      text: "Log Out",
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CustomAlertDialog(
                                              icon: Icons.logout_outlined,
                                              text: "Are you sure you want to Log Out?",
                                              onAccept: () async {
                                                try {
                                                  Global.authBloc.add(SignOutEvent());
                                                  Global.authBloc.add(ClearBloc());
                                                  Navigator.of(context).pop();
                                                  while (context.canPop()) {
                                                    context.pop();
                                                  }
                                                }
                                                catch (e) {
                                                  if (context.mounted) {
                                                    Navigator.of(context).pop();
                                                  }
                                                  await showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return CustomErrorDialog();
                                                    },
                                                  );
                                                }
                                              }
                                            );
                                          }
                                        );
                                      },
                                    ),
                                  ]
                                ),
                              );
                            }
                          ),
        
                          CustomListViewDrawerChild(
                            width: value,
                            icon: Padding(
                              padding: const EdgeInsets.all(48.0),
                              child: BlocBuilder <ThemeDataBloc, ThemeDataStates> (
                                builder: (context, state) {
                                    return SvgPicture.asset(
                                      "assets/vectors/uLearning_logo_only_black.svg",
                                      colorFilter: ColorFilter.mode(
                                        context.colorScheme.onSecondaryContainer,
                                        BlendMode.srcIn,
                                      ),
                                    );
                                }
                              ),
                            ),
                            text: "uLearning Admin",
                            onPressed: null,
                          )
                        ],
                      )
                    ),
                  ],
                );
              },
            )
          ], 
        ),
      ),
    );
  }
}