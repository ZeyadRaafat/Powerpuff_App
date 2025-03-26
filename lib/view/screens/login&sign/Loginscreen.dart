import 'package:flutter/material.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/view/widgets/AccountCheck.dart';
import 'package:go_router/go_router.dart';
import 'package:e_learning/core/utils/assets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: bubbelscolor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login to your account',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: bubbelscolor),
            ),
            Container(
              height: 250,
              width: 250,
              child: Image.asset("assets/images/ppf.png"),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: bubbelscolor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.person),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 237, 237, 237),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: bubbelscolor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.lock),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 237, 237, 237),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text("Remember Me"),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: bubbelscolor,
                  foregroundColor: Colors.white,
                ),
                child: Text("Login"),
              ),
            ),
            SizedBox(height: 10),
            AccountCheck(
              press: () => GoRouter.of(context).go('/Signup_screen'),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook, color: Colors.blue, size: 30.0),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.apple, color: Colors.black, size: 30.0),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                      Icon(Icons.remove_red_eye, color: Colors.red, size: 30.0),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
