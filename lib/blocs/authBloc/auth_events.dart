class AuthEvents {}

class EmailEvent extends AuthEvents {
  EmailEvent({required this.email});

  final String email;
}

class PasswordEvent extends AuthEvents {
  PasswordEvent({required this.password});

  final String password;
}

class SignInEvent extends AuthEvents {
  SignInEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class SignOutEvent extends AuthEvents {}
class ClearError extends AuthEvents {}
class ClearField extends AuthEvents {}
class ClearBloc extends AuthEvents {}