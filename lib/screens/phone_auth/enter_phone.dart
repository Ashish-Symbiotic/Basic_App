import 'package:basic_app/bloc/auth_bloc/auth_cubit.dart';
import 'package:basic_app/bloc/auth_bloc/auth_state.dart';
import 'package:basic_app/screens/phone_auth/enter_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class enter_phone extends StatelessWidget {
  const enter_phone({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter your Phone Number",
              ),
              showCursor: true,
              controller: phoneController,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeSentState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Enter_Otp())));
                } else {
                  print("State is " + state.toString());
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => enter_phone()));

                      String phonenumber = "+91${phoneController.text}";
                      BlocProvider.of<AuthCubit>(context).sendOTP(phonenumber);
                    },
                    child: const Text("Sign in"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
