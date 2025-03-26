import 'package:e_learning/constants.dart';
import 'package:e_learning/core/utils/assets.dart';
import 'package:e_learning/view/widgets/onetime_splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash1V3 extends StatefulWidget {
  const Splash1V3({super.key});

  @override
  State<Splash1V3> createState() => _Splash1V3State();
}

class _Splash1V3State extends State<Splash1V3> {
  @override
  Widget build(BuildContext context) {
    return MiniSplashh(
      hero: AssetsData.buttercup,
      text: 'Quit stalling! Let\'s power up your skills with Elera—right now!',
      onPressed: () => GoRouter.of(context).go('/splash1v3'),
      D1: false,
      D2: false,
      D3: true,
      color: buttercupcolor,
    );
  }

}
