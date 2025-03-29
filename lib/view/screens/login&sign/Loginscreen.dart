import 'package:e_learning/view/widgets/default_text.dart';
import 'package:e_learning/view/widgets/elevated_button.dart';
import 'package:e_learning/view/widgets/login_ways.dart';
import 'package:e_learning/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/view/widgets/AccountCheck.dart';
import 'package:go_router/go_router.dart';
import '/core/utils/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultText(defaulttext: "Login to your account"),
            SizedBox(
              height: 250,
              width: 250,
              child: Image.asset(AssetsData.allofthem),
            ),
            SizedBox(height: 10),
            TextFieldFor(
              textforfield: 'Email',
            ),
            SizedBox(height: 10),
            TextFieldFor(
              textforfield: 'Your Password',
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
                text: 'login', backgroundColor: bubbelscolor, onPressed: () {}),
            SizedBox(height: 10),
            AccountCheck(
              press: () => GoRouter.of(context).go('/Signup_screen'),
            ),
            SizedBox(height: 5),
            LoginWays(),
          ],
        ),
      ),
    );
  }
}
