import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:ulearning_app_admin/blocs/authBloc/auth_bloc.dart";
import "package:ulearning_app_admin/blocs/routeBloc/route_events.dart";
import "package:ulearning_app_admin/screens/auth/auth_page.dart";
import "package:ulearning_app_admin/screens/home/course/course_page.dart";
import "package:ulearning_app_admin/screens/home/courseType/course_type_page.dart";
import "package:ulearning_app_admin/screens/home/home_page.dart";
import "package:ulearning_app_admin/screens/home/layout_home_page.dart";
import "package:ulearning_app_admin/screens/home/settings/settings_page.dart";
import "package:ulearning_app_admin/screens/home/user/user_page.dart";
import "package:ulearning_app_admin/screens/status/not_found_page.dart";
import "package:ulearning_app_admin/utils/constants/global.dart";
import "package:ulearning_app_admin/utils/enum/auth.dart";

final _navKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

GoRouter router (AuthBloc authBloc) {
  return GoRouter(
    navigatorKey: _navKey,
    initialLocation: "/login",
    // ignore: body_might_complete_normally_nullable
    redirect: (context, state) {
      if ((Global.storageService.getUserToken() != "" || Global.storageService.getUserToken().isNotEmpty) && state.fullPath == "/login") {
        return "/home";
      }
      else if ((authBloc.state.authStatus == AuthStatus.unknown || authBloc.state.authStatus == AuthStatus.unauthenticated) && Global.storageService.getUserToken() == "") {
        return "/login";
      }
    },
    errorBuilder: (context, state) {
      return NotFoundPage();
    },
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigationKey,
        builder: (context, state, child) {
          if (state.fullPath == "/login" || state.fullPath == "/") {
            return child;
          }

          return LayoutHomePage(
            child: child
          );
        },

        routes: [
          GoRoute(
            path: "/login",
            builder: (context, state) {
              return AuthPage();
            }
          ),
          GoRoute(
            path: "/home",
            builder: (context, state) {
              if (Global.routeBloc.state.path != state.fullPath) {
                Global.routeBloc.add(
                  ChangeEvent(path: state.fullPath!)
                );
              }
              return HomePage();
            }
          ),

          GoRoute(
            path: "/courses",
            builder: (context, state) {
              if (Global.routeBloc.state.path != state.fullPath) {
                Global.routeBloc.add(
                  ChangeEvent(path: state.fullPath!)
                );
              }
              return CoursePage();
            }
          ),

          GoRoute(
            path: "/courseTypes",
            builder: (context, state) {
              if (Global.routeBloc.state.path != state.fullPath) {
                Global.routeBloc.add(
                  ChangeEvent(path: state.fullPath!)
                );
              }
              return CourseTypePage();
            }
          ),

          GoRoute(
            path: "/users",
            builder: (context, state) {
              if (Global.routeBloc.state.path != state.fullPath) {
                Global.routeBloc.add(
                  ChangeEvent(path: state.fullPath!)
                );
              }
              return UserPage();
            }
          ),

          GoRoute(
            path: "/settings",
            builder: (context, state) {
              if (Global.routeBloc.state.path != state.fullPath) {
                Global.routeBloc.add(
                  ChangeEvent(path: state.fullPath!)
                );
              }
              return SettingsPage();
            }
          ),
        ],
      ),
    ],
  );
}