import 'package:e_learning/view/widgets/default_text.dart';
import 'package:e_learning/view/widgets/elevated_button.dart';
import 'package:e_learning/view/widgets/login_ways.dart';
import 'package:e_learning/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/view/widgets/AccountCheck.dart';
import 'package:e_learning/constants.dart';
import 'package:get/get.dart';

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
              hintText: 'name',
            ),
            SizedBox(height: 10),
            TextFieldFor(
              hintText: 'your pass',
              isPasswordField: true,
            ),
            SizedBox(height: 10),
            TextFieldFor(
              hintText: 'write pass again',
              isPasswordField: true,
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
              press: () => Get.toNamed('/Login_screen'),
            ),
            SizedBox(height: 5),
            LoginWays(),
          ],
        ),
      ),
    );
  }
}
