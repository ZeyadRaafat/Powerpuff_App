import 'package:Powerpuff/constants.dart';
import 'package:Powerpuff/core/utils/assets.dart';
import 'package:Powerpuff/view/screens/splash/splash1_v2.dart';
import 'package:Powerpuff/view/widgets/onetime_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash1V1 extends StatefulWidget {
  const Splash1V1({super.key});

  @override
  State<Splash1V1> createState() => _Splash1V1State();
}

class _Splash1V1State extends State<Splash1V1> {
  @override
  Widget build(BuildContext context) {
    return MiniSplashh(
      hero: AssetsData.blossom,
      text: 'Knowledge is power! Learn from the best with top courses and mentors!',
      onPressed: () => Get.to(Splash1V2(),transition: Transition.fade,duration: Duration(milliseconds: 500)),
      D1: true,
      color: blossomcolor,
      buttext: 'Next',
    );
  }

}
