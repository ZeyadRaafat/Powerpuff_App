import 'package:Powerpuff/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Powerpuff/features/view_models/signup_viewmodel.dart';
import 'package:Powerpuff/view/widgets/default_text.dart';
import 'package:Powerpuff/view/widgets/elevated_button.dart';
import 'package:Powerpuff/view/widgets/login_ways.dart';
import 'package:Powerpuff/view/widgets/text_field.dart';
import 'package:Powerpuff/view/widgets/AccountCheck.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final SignupViewModel viewModel = Get.put(SignupViewModel());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            const SizedBox(height: 100),
            DefaultText(
              defaulttext: "Create an account",
              textcolor: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              width: 250,
              child: Image.asset(AssetsData.allofthem),
            ),
            const SizedBox(height: 30),

            TextFieldFor(
              prefixIcon: Icons.verified_user,
              controller: nameController,
              hintText: 'Username',
            ),
            const SizedBox(height: 16),

            TextFieldFor(
              prefixIcon: Icons.email,
              controller: emailController,
              hintText: 'Email Address',
            ),
            const SizedBox(height: 16),

            TextFieldFor(
              prefixIcon: Icons.password,
              controller: passwordController,
              hintText: 'Password',
              isPasswordField: true,
            ),
            const SizedBox(height: 30),

            Obx(
                  () => viewModel.isLoading.value
                  ? CircularProgressIndicator()
                  : CustomElevatedButton(
                text: 'Sign Up',
                onPressed: viewModel.registerUser,
              ),
            ),

            const SizedBox(height: 20),

            AccountCheck(
              login: false,
              press: () => Get.toNamed('/Login_screen'),
            ),
            const SizedBox(height: 10),
            const LoginWays(),
          ],),
        )
      ),
    );
  }
}
