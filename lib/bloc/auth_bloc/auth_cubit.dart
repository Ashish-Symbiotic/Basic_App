import 'package:basic_app/bloc/auth_bloc/auth_state.dart';
import 'package:basic_app/screens/phone_auth/enter_otp.dart';
import 'package:basic_app/screens/phone_auth/enter_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitState());

  String _verificationId = "";
  String Name = "Ashish";
  void sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        print("Verification id from Code sent State" + _verificationId);
        Name = "Suraj";
        emit(AuthCodeSentState());
      },
      verificationCompleted: (phoneAuthCredential) {
        siginWithPhone(phoneAuthCredential);
        print("Verification Compelete" +
            phoneAuthCredential.verificationId.toString());
        //  emit(AuthCodeVerification());
      },
      verificationFailed: (error) =>
          {emit(AuthErrorState(error.message.toString()))},
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
        print("Code Time Out");
        print("Verification id at the  timeout function" + _verificationId);
      },
    );
  }

  void verifyOTP(String otp) async {
    print("Verfiying Otp");
    emit(AuthLoadingState());
    print("_verficiation id " + _verificationId.toString());
    print("Name is " + Name);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: otp);
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
      print("This is the error " + e.message.toString());
      emit(AuthErrorState(e.message.toString()));
    }
  }
}
