

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_admin/blocs/routeBloc/route_events.dart';
import 'package:ulearning_app_admin/blocs/routeBloc/route_states.dart';

class RouteBloc extends Bloc <RouteEvents, RouteStates> {
  RouteBloc() : super(RouteStates()) {
    on <ChangeEvent> ((event, emit) {
      emit(state.copyWith(
        path: event.path,
      ));
    });
  }
}