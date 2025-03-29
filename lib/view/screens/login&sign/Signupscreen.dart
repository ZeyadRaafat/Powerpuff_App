import 'package:e_learning/view/widgets/default_text.dart';
import 'package:e_learning/view/widgets/elevated_button.dart';
import 'package:e_learning/view/widgets/login_ways.dart';
import 'package:e_learning/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/view/widgets/AccountCheck.dart';
import 'package:e_learning/constants.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultText(defaulttext: "Create an account"),
            SizedBox(
              height: 250,
              width: 250,
              child: Image.asset("assets/images/ppf.png"),
            ),
            SizedBox(height: 10),
            TextFieldFor(
              textforfield: 'name',
            ),
            SizedBox(height: 10),
            TextFieldFor(
              textforfield: 'your pass',
            ),
            SizedBox(height: 10),
            TextFieldFor(
              textforfield: 'write pass again',
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              text: 'Sign Up',
              backgroundColor: bubbelscolor,
              onPressed: () {},
            ),
            SizedBox(height: 10),
            AccountCheck(
              login: false,
              press: () => GoRouter.of(context).go('/Login_screen'),
            ),
            SizedBox(height: 5),
            LoginWays(),
          ],
        ),
      ),
    );
  }

  Text defaulttext() {
    return Text(
      'Login to your account',
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: bubbelscolor),
    );
  }
}
