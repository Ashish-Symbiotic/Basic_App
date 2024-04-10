abstract class SigninState {}

class SigninIntialState extends SigninState {}

class SiginErrorState extends SigninState {
  final String errorMessage;
  SiginErrorState(this.errorMessage);
}

class SigninValidState extends SigninState {}

class SigninLoadingState extends SigninState {}
