import 'package:Powerpuff/view/widgets/default_text.dart';
import 'package:Powerpuff/view/widgets/elevated_button.dart';
import 'package:Powerpuff/view/widgets/login_ways.dart';
import 'package:Powerpuff/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:Powerpuff/view/widgets/AccountCheck.dart';
import 'package:Powerpuff/constants.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultText(defaulttext: "Create an account",textcolor: Theme.of(context).primaryColor,),
              SizedBox(
                height: 250,
                width: 250,
                child: Image.asset("assets/images/ppf.png"),
              ),
              SizedBox(height: 10),
              TextFieldFor(
                hintText: 'Username',
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
        ]
      ),
    );
  }
}
