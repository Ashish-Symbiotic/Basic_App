abstract class SiginInEvent {}

class SiginInTextChangeEvent extends SiginInEvent {
  final String emailValue;
  final String passwordValue;
  SiginInTextChangeEvent(this.emailValue, this.passwordValue);
}

class SigninSubmitEvent extends SiginInEvent {
  final String email;
  final String password;
  SigninSubmitEvent(this.email, this.password);
}
