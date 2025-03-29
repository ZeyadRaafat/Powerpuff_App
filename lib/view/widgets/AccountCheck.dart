import 'package:flutter/material.dart';
import '/constants.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: bubbelscolor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: bubbelscolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
