//import 'dart:html';

//import 'package:basic_app/bloc/blocs/internet_bloc.dart';
import 'package:basic_app/bloc/state/internet_state.dart';
import 'package:basic_app/cubit/internet_cubit_state.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen2 extends StatelessWidget {
  const MainScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubitState, InternetCubitStateEnum>(
            listener: (context, state) {
              if (state == InternetCubitStateEnum.gained) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Connected"), backgroundColor: Colors.green));
              } else if (state == InternetCubitStateEnum.lost) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Lost Connection"),
                    backgroundColor: Colors.red));
              }
            },
            builder: (context, state) {
              print("thhis is State " + state.toString());
              if (state == InternetCubitStateEnum.gained) {
                return const Text(
                  "Internet Connected",
                  style: TextStyle(color: Colors.green),
                );
              } else if (state == InternetCubitStateEnum.lost) {
                return const Text(
                  "Internet Lost",
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return const Text(
                  "Loading....",
                  style: TextStyle(color: Colors.green),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
