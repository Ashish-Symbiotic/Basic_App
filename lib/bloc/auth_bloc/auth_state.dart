abstract class AuthState {}

class AuthCodeSentState extends AuthState {}

class AuthCodeVerification extends AuthState {}

class AuthLoggedInState extends AuthState {
  String firebaseUser;
  AuthLoggedInState(this.firebaseUser);
}

class AuthLoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}
