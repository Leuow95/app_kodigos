abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLogged extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
