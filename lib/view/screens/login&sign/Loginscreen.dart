import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Powerpuff/core/utils/assets.dart';
import 'package:Powerpuff/view/widgets/default_text.dart';
import 'package:Powerpuff/view/widgets/elevated_button.dart';
import 'package:Powerpuff/view/widgets/login_ways.dart';
import 'package:Powerpuff/view/widgets/text_field.dart';
import 'package:Powerpuff/view/widgets/AccountCheck.dart';
import 'package:Powerpuff/features/view_models/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginViewModel loginViewModel = Get.put(LoginViewModel());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                DefaultText(
                  defaulttext: "Login to your account",
                  textcolor: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 300,
                  width: 250,
                  child: Image.asset(AssetsData.allofthem),
                ),
                const SizedBox(height: 10),
                TextFieldFor(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 10),
                TextFieldFor(
                  controller: passwordController,
                  hintText: 'Your Password',
                  isPasswordField: true,
                  prefixIcon: Icons.password,
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return loginViewModel.isLoading.value
                      ? CircularProgressIndicator(
                          color: Theme.of(context).primaryColor)
                      : CustomElevatedButton(
                          text: 'Login',
                          backgroundColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            loginViewModel.loginUser(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        );
                }),
                const SizedBox(height: 15),
                AccountCheck(
                  press: () => Get.toNamed('/Signup_screen'),
                ),
                const SizedBox(height: 5),
                LoginWays(),
              ],
            ),
          ),
      ),
    );
  }
}
