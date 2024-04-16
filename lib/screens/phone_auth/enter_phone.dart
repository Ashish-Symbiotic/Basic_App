import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class enter_phone extends StatelessWidget {
  const enter_phone({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phone = new TextEditingController();
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter your Phone Number",
            ),
            showCursor: true,
            controller: phone,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Sign in")),
        ],
      ),
    );
  }
}
