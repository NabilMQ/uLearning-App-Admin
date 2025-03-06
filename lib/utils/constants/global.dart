import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_bloc.dart';
import 'package:ulearning_app_admin/blocs/routeBloc/route_bloc.dart';
import 'package:ulearning_app_admin/utils/globalStorage/global_storage.dart';
import 'package:url_strategy/url_strategy.dart';

class Global {
  static late StorageService storageService;
  static final RouteBloc routeBloc = RouteBloc();
  static final AuthBloc authBloc = AuthBloc();
  
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();
    GoRouter.optionURLReflectsImperativeAPIs = true;
    storageService = await StorageService().init();
  }
 
}