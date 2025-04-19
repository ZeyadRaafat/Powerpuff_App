import 'package:flutter/material.dart';

class LoginWays extends StatelessWidget {
  const LoginWays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.facebook, color: Colors.blue, size: 30.0),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.apple, color: Theme.of(context).indicatorColor, size: 30.0),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.remove_red_eye, color: Colors.red, size: 30.0),
          onPressed: () {},
        ),
      ],
    );
  }
}
