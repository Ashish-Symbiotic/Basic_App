import 'package:basic_app/bloc/auth_bloc/auth_state.dart';
import 'package:basic_app/screens/phone_auth/enter_otp.dart';
import 'package:basic_app/screens/phone_auth/enter_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitState());

  String _verficationId = "";

  void sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verficationId = verificationId;
        emit(AuthCodeSentState());
      },
      verificationCompleted: (phoneAuthCredential) {
        siginWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) =>
          {emit(AuthErrorState(error.message.toString()))},
      codeAutoRetrievalTimeout: (verificationId) =>
          {_verficationId = verificationId},
    );
  }

  void verifyOTP(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verficationId, smsCode: otp);
    siginWithPhone(credential);
  }

  void siginWithPhone(PhoneAuthCredential phoneAuthCredential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      if (userCredential.user != null) {
        emit(AuthLoggedInState(userCredential.user.toString()));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message.toString()));
    }
  }
}
