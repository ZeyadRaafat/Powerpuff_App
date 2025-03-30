import 'package:Powerpuff/constants.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
      {super.key, required this.defaulttext, this.textcolor = Colors.black});
  final String defaulttext;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return Text(
      defaulttext,
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: textcolor),
    );
  }
}
