import 'package:Powerpuff/constants.dart';
import 'package:Powerpuff/core/utils/assets.dart';
import 'package:Powerpuff/view/widgets/onetime_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/cupit/splash_cupit.dart';


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
        onPressed: () => context.read<SplashCubit>().completeSplashSequence(context),
        D3: true,
        color: buttercupcolor,
        buttext: 'Finish',
    );
  }
}
