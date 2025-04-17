import 'package:Powerpuff/view/screens/Homescreen/Homemain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../features/view_models/theme_viewmodel.dart';
import '../widgets/elevated_button.dart';

class HomePage extends StatelessWidget {
  final ThemeViewModel themeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Theme")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              onPressed: () => themeViewModel.changeTheme("Bubbels"),
              backgroundColor: bubbelscolor,
              text: "Bubbels Theme",
              textColor: Colors.black,
            ),
            CustomElevatedButton(
              onPressed: () => themeViewModel.changeTheme("Blossom"),
              backgroundColor: blossomcolor,
              text: "Blossom Theme",
              textColor: Colors.black,
            ),
            CustomElevatedButton(
              onPressed: () => themeViewModel.changeTheme("Buttercup"),
              backgroundColor: buttercupcolor,
              text: "Buttercup Theme",
              textColor: Colors.black,
            ),
            SizedBox(
              height: 100,
            ),
            CustomElevatedButton(
              onPressed: () => Get.to(Homemain(),
                  transition: Transition.fade,
                  duration: Duration(milliseconds: 500)),
              backgroundColor: Colors.black,
              text: "homeee",
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
