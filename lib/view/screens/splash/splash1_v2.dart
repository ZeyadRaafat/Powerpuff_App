import 'package:e_learning/constants.dart';
import 'package:e_learning/core/utils/assets.dart';
import 'package:e_learning/view/widgets/onetime_splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      onPressed: () => GoRouter.of(context).go('/splash1v3'),
      D1: false,
      D2: true,
      D3: false,
      color: bubbelscolor,
      buttext: 'Next',
    );
  }

}
