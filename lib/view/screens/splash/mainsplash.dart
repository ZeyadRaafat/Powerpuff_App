import 'package:e_learning/constants.dart';
import 'package:e_learning/core/utils/assets.dart';
import 'package:e_learning/view/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context).go('/splash1v1');
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
