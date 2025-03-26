import 'package:e_learning/constants.dart';
import 'package:e_learning/core/utils/assets.dart';
import 'package:e_learning/view/widgets/onetime_splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      onPressed: () => GoRouter.of(context).go('/splash1v2'),
      D1: true,
      D2: false,
      D3: false,
      color: blossomcolor,
    );
  }

}
