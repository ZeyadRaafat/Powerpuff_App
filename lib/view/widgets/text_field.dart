import 'package:e_learning/constants.dart';
import 'package:flutter/material.dart';

class TextFieldFor extends StatelessWidget {
  const TextFieldFor({super.key, required this.textforfield});
  final String textforfield;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: bubbelscolor,
      onSaved: (email) {},
      decoration: InputDecoration(
        hintText: textforfield,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.lock),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 237, 237, 237),
      ),
    );
  }
}
