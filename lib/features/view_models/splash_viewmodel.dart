import 'package:e_learning/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isFirstTime = true;

  bool get isFirstTime => _isFirstTime;

  Future<void> checkFirstTime() async {
    _isFirstTime = LocalStorageService.getFirstTime();
    notifyListeners();
  }

  Future<void> setFirstTimeFalse() async {
    await LocalStorageService.saveFirstTime(false);
    _isFirstTime = false;
    notifyListeners();
  }

  Future<void> navigateAfterSplash(BuildContext context) async {
    await checkFirstTime();

    Future.delayed(Duration(seconds: 4), () {
      if (_isFirstTime) {
        GoRouter.of(context).go('/splash1v1');
      } else {
        GoRouter.of(context).go('/home');
      }
    });
  }
  Future<void> completeSplashSequence(BuildContext context) async {
    await setFirstTimeFalse();
    GoRouter.of(context).go('/home');
  }
}
