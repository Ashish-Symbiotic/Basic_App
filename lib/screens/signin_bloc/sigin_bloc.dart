//import 'dart:html';

import 'package:basic_app/screens/signin_bloc/sigin_event.dart';
import 'package:basic_app/screens/signin_bloc/sigin_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signin_bloc extends Bloc<SiginInEvent, SigninState> {
  Signin_bloc() : super(SigninIntialState()) {
    on<SiginInTextChangeEvent>((event, emit) {
      if (!EmailValidator.validate(event.emailValue)) {
        emit(SiginErrorState("Please Enter a Valid Email"));
      } else if (event.passwordValue.length < 7) {
        emit(SiginErrorState("Please Enter a Valid Password"));
      } else {
        emit(SigninValidState());
      }
    });
    on<SigninSubmitEvent>((event, emit) {
      emit(SigninLoadingState());
    });
  }
}
