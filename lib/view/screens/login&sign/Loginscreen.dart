import 'package:e_learning/view/widgets/default_text.dart';
import 'package:e_learning/view/widgets/elevated_button.dart';
import 'package:e_learning/view/widgets/login_ways.dart';
import 'package:e_learning/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/view/widgets/AccountCheck.dart';
import 'package:get/get.dart';
import '/core/utils/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                DefaultText(defaulttext: "Login to your account"),
                SizedBox(
                  height: 300,
                  width: 250,
                  child: Image.asset(AssetsData.allofthem),
                ),
                const SizedBox(height: 10),
                TextFieldFor(hintText: 'Email'),
                const SizedBox(height: 10),
                TextFieldFor(hintText: 'Your Password',isPasswordField: true,),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'login',
                  backgroundColor: bubbelscolor,
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                AccountCheck(
                  press: () => Get.toNamed('/Signup_screen'),
                ),
                const SizedBox(height: 5),
                LoginWays(),
              ],
            ),
          ), // ✅ Properly closed the Padding widget
        ],
      ),
    );
  }
}
