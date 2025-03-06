
import 'package:ulearning_app_admin/utils/entities/admin.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';
import 'package:ulearning_app_admin/utils/enum/auth.dart';

class AuthStates {
  AuthStates({
    this.email = "",
    this.password = "",
    this.adminAccount,
    this.authStatus = AuthStatus.unknown,
    this.apiStatus = ApiStatus.success,
  });

  final String email;
  final String password;
  final AdminAccount? adminAccount;
  final AuthStatus authStatus;
  final ApiStatus apiStatus;

  AuthStates copyWith({
    String? email,
    String? password,
    AdminAccount? adminAccount,
    AuthStatus? authStatus,
    ApiStatus? apiStatus,
  }) {
    return AuthStates(
      email: email ?? this.email,
      password: password ?? this.password,
      adminAccount: adminAccount ?? this.adminAccount,
      authStatus: authStatus ?? this.authStatus,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }
}