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
            /*yahan par Bloc consumer ka use kiya hai jo states lega aur events ko emit karega 
                ye code filhaal Cubit ke liye hai , jismein function aur events hai (shayad States hai 😅)
                consumer mein hum listner ka use karte hai, jo ki background process ke liye use hota hai
                hum bina Consumer ke bhi use kar skate hai BLoC provider ke saath(ye Main mein use hua hai ).


               */

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
              debugPrint("This is State $state");
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
