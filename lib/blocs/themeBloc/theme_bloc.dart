import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_admin/blocs/themeBloc/theme_events.dart';
import 'package:ulearning_app_admin/blocs/themeBloc/theme_states.dart';

class ThemeDataBloc extends Bloc <ThemeDataEvents, ThemeDataStates> {
  ThemeDataBloc() : super(ThemeDataStates()) {
    on <ChangeThemeDataEvents> ((event, emit) {
      emit(state.copyWith(
        isLightMode: event.isLightMode,
      ));
    });
    on <ChangeThemeColorEvents> ((event, emit) {
      emit(state.copyWith(
        themeColor: event.themeColor,
      ));
    });
  }
}