import 'package:basic_app/bloc/auth_bloc/auth_cubit.dart';
import 'package:basic_app/bloc/auth_bloc/auth_state.dart';
import 'package:basic_app/screens/phone_auth/all_done.dart';
import 'package:basic_app/screens/phone_auth/enter_phone.dart';
import 'package:basic_app/screens/signin_screen.dart';
import 'package:firebase_auth_platform_interface/src/providers/phone_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Enter_Otp extends StatelessWidget {
  const Enter_Otp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneOtp = TextEditingController();
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter your OTP",
            ),
            showCursor: true,
            controller: phoneOtp,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is AuthLoggedInState) {
                Navigator.popUntil(
                    context,
                    (route) =>
                        route !=
                        MaterialPageRoute(builder: (context) => enter_phone()));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => enter_phone()));
              } else if (state is AuthErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error.toString()),
                  duration: const Duration(milliseconds: 100),
                ));
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const CircularProgressIndicator();
              }

              return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context)
                        .verifyOTP(phoneOtp.text.toString());
                  },
                  child: const Text("Sign in"));
            },
          ),
        ],
      ),
    );
  }
}
