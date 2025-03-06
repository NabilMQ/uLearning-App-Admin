import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_bloc.dart';
import 'package:ulearning_app_admin/blocs/courseListBloc/course_list_bloc.dart';
import 'package:ulearning_app_admin/blocs/courseTypeListBloc/course_type_list_bloc.dart';
import 'package:ulearning_app_admin/blocs/routeBloc/route_bloc.dart';
import 'package:ulearning_app_admin/blocs/themeBloc/theme_bloc.dart';
import 'package:ulearning_app_admin/blocs/themeBloc/theme_states.dart';
import 'package:ulearning_app_admin/utils/constants/global.dart';
import 'package:ulearning_app_admin/utils/routes/routes.dart';

void main() async {
  await Global.init();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return ThemeDataBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return AuthBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return CoursesListBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return CoursesTypeListBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return RouteBloc();
          },
        ),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  late final GoRouter route;

  @override
  void initState() {
    route = router(Global.authBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <ThemeDataBloc, ThemeDataStates>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: state.themeColor,
            brightness: Brightness.light,
            fontFamily: "Nunito",
          ),
          darkTheme: ThemeData(
            colorSchemeSeed: state.themeColor,
            brightness: Brightness.dark,
            fontFamily: "Nunito",
          ),
          themeMode: state.isLightMode
            ? ThemeMode.light
            : ThemeMode.dark,
          routerConfig: route,
        );
      }
    );
  }
}