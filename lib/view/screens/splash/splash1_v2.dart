import 'package:Powerpuff/constants.dart';
import 'package:Powerpuff/core/utils/assets.dart';
import 'package:Powerpuff/view/screens/splash/splash1_v3.dart';
import 'package:Powerpuff/view/widgets/onetime_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash1V2 extends StatefulWidget {
  const Splash1V2({super.key});

  @override
  State<Splash1V2> createState() => _Splash1V2State();
}

class _Splash1V2State extends State<Splash1V2> {
  @override
  Widget build(BuildContext context) {
    return MiniSplashh(
        hero: AssetsData.bubbels,
        text: 'Yay! You can learn anytime, anywhere—super easy and totally fun!',
        onPressed: () => Get.to(Splash1V3(),transition: Transition.fade,duration: Duration(milliseconds: 500)),
        D2: true,
        color: bubbelscolor,
        buttext: 'Next',
      );
  }

}
