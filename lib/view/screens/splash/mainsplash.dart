import 'package:Powerpuff/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/cupit/splash_cupit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashCubit>().navigateAfterSplash(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment(0, -1),
            child: Lottie.asset(
              AssetsData.gif1,
              width: 350,
              height: 600,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 40),
          Container(
            alignment: Alignment(0, 0),
            child: Lottie.asset(
              AssetsData.loading,
              width: 100,
              height: 130,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
