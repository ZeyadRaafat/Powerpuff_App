import 'package:Powerpuff/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Powerpuff/constants.dart';
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
              controller: nameController,
              hintText: 'Username',
            ),
            const SizedBox(height: 16),

            TextFieldFor(
              controller: emailController,
              hintText: 'Email Address',
            ),
            const SizedBox(height: 16),

            TextFieldFor(
              controller: passwordController,
              hintText: 'Password',
              isPasswordField: true,
            ),
            const SizedBox(height: 30),

            Obx(
                  () => viewModel.isLoading.value
                  ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor))
                  : CustomElevatedButton(
                text: 'Sign Up',
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  final name = nameController.text;
                  final email = emailController.text.trim();
                  final pass = passwordController.text;

                  if (name.isEmpty || email.isEmpty || pass.isEmpty) {
                    Get.snackbar(
                      'Error',
                      'All fields are required',
                      backgroundColor: blossomcolor,
                      colorText: Colors.white,
                    );
                    return;
                  }
                  
                  // Validate email format
                  if (!GetUtils.isEmail(email)) {
                    Get.snackbar(
                      'Error',
                      'Please enter a valid email address',
                      backgroundColor: blossomcolor,
                      colorText: Colors.white,
                    );
                    return;
                  }
                  
                  // Validate password length
                  if (pass.length < 6) {
                    Get.snackbar(
                      'Error',
                      'Password must be at least 6 characters',
                      backgroundColor: blossomcolor,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  // Call the register method from viewModel
                  viewModel.registerUser(
                    name: name,
                    email: email,
                    password: pass,
                  );
                },
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
