import 'package:basic_app/screens/signin_bloc/sigin_bloc.dart';
import 'package:basic_app/screens/signin_bloc/sigin_event.dart';
import 'package:basic_app/screens/signin_bloc/sigin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailValue = new TextEditingController();
  TextEditingController passValue = new TextEditingController();

  bool passwordCheck = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocBuilder<Signin_bloc, SigninState>(
        builder: (context, state) {
          if (state is SiginErrorState) {
            return Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            );
          } else {
            return Column();
          }
        },
      ),
      const SizedBox(
        height: 10,
      ),
      TextField(
        controller: emailValue,
        onChanged: (value) {
          BlocProvider.of<Signin_bloc>(context)
              .add(SiginInTextChangeEvent(emailValue.text, passValue.text));
        },
        decoration: InputDecoration(label: Text("Email")),
      ),
      TextField(
        controller: passValue,
        obscureText: passwordCheck,
        onChanged: (value) {
          BlocProvider.of<Signin_bloc>(context)
              .add(SiginInTextChangeEvent(emailValue.text, passValue.text));
        },
        decoration: InputDecoration(
          label: const Text("Password"),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordCheck = !passwordCheck;
              });
            },
            icon: Icon(passwordCheck
                ? Icons.remove_red_eye_rounded
                : Icons.visibility_off),
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),
      BlocBuilder<Signin_bloc, SigninState>(
        builder: (context, state) {
          if (state is SigninValidState) {
            return Container(
                margin: const EdgeInsets.all(20),
                child: const CircularProgressIndicator());
          } else {
            return ElevatedButton(
                onPressed: () {
                  if (state is SigninValidState) {
                    BlocProvider.of<Signin_bloc>(context).add(
                        SigninSubmitEvent(emailValue.text, passValue.text));
                  }
                },
                style: (state is SiginErrorState)
                    ? ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey))
                    : ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                child: const Text("Click me"));
          }
        },
      )
    ]);
  }
}
