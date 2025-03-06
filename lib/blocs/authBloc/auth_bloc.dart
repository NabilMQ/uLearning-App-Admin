import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_events.dart';
import 'package:ulearning_app_admin/blocs/authBloc/auth_states.dart';
import 'package:ulearning_app_admin/utils/api/admin_api.dart';
import 'package:ulearning_app_admin/utils/entities/admin.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';
import 'package:ulearning_app_admin/utils/enum/auth.dart';

class AuthBloc extends Bloc <AuthEvents, AuthStates> {
  AuthBloc() : super(AuthStates()) {
    on <EmailEvent> ((event, emit) {
      emit(state.copyWith(
        email: event.email,
      ));
    });

    on <PasswordEvent> ((event, emit) {
      emit(state.copyWith(
        password: event.password,
      ));
    });

    on <ClearError> ((event, emit) {
      emit(state.copyWith(
        apiStatus: ApiStatus.success,  
      ));
    });

    on <ClearField> ((event, emit) {
      emit(state.copyWith(
        email: null,
        password: null,  
      ));
    });

    on <ClearBloc> ((event, emit) {
      emit(state.copyWith(
        email: "",
        password: "",
        adminAccount: null,
        authStatus: AuthStatus.unauthenticated,
        apiStatus: ApiStatus.idle,  
      ));
    });

    on <SignInEvent> ((event, emit) async {
      emit(state.copyWith(
        apiStatus: ApiStatus.processing,
      ));

      try {
        String adminAccount = await AdminAPI.signInAdmin(
          email: event.email,
          password: event.password,
        );

        if (adminAccount == "Something went wrong" || jsonDecode(adminAccount)["code"] != 200) {
          throw "Something went wrong";
        }
        
        emit(state.copyWith(
          adminAccount: AdminAccount.fromResponse(adminAccount),
          authStatus: AuthStatus.authenticated,
          apiStatus: ApiStatus.success,
        ));
      }
      catch (e) {
        emit(state.copyWith(
          apiStatus: ApiStatus.error,
        ));
      }
    });

    on <SignOutEvent> ((event, emit) async {
      emit(state.copyWith(
        apiStatus: ApiStatus.processing,
      ));

      try {
        await AdminAPI.signOutAdmin();
        emit(state.copyWith(
          authStatus: AuthStatus.unauthenticated,
          apiStatus: ApiStatus.success,
        ));
      }
      catch (e) {
        emit(state.copyWith(
          apiStatus: ApiStatus.error,
        ));
      }
    });
  }
}