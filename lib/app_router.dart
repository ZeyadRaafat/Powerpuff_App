import 'package:e_learning/view/screens/homePage.dart';
import 'package:e_learning/view/screens/splash/mainsplash.dart';
import 'package:e_learning/view/screens/splash/splash1_v1.dart';
import 'package:e_learning/view/screens/splash/splash1_v2.dart';
import 'package:e_learning/view/screens/splash/splash1_v3.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_learning/view/screens/login&sign/Loginscreen.dart';
import 'package:e_learning/view/screens/login&sign/Signupscreen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/splash1v1',
        pageBuilder: (context, state) =>
            _customPageTransition(state, Splash1V1()),
      ),
      GoRoute(
        path: '/splash1v2',
        pageBuilder: (context, state) =>
            _customPageTransition(state, Splash1V2()),
      ),
      GoRoute(
        path: '/splash1v3',
        pageBuilder: (context, state) =>
            _customPageTransition(state, Splash1V3()),
      ),
      GoRoute(
        path: '/Login_screen',
        pageBuilder: (context, state) =>
            _customPageTransition(state, LoginScreen()),
      ),
      GoRoute(
        path: '/Signup_screen',
        pageBuilder: (context, state) =>
            _customPageTransition(state, SignupScreen()),
      ),
    ],
  );

  static CustomTransitionPage _customPageTransition(
      GoRouterState state, Widget page) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0), // Start from right
            end: Offset.zero, // End at center
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}
