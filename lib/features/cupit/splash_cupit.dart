import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Powerpuff/core/services/local_storage_service.dart';
import 'package:get/get.dart';


class SplashState {
  final bool isFirstTime;

  SplashState({required this.isFirstTime});
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(isFirstTime: true)) {
    checkFirstTime();
  }

  Future<void> checkFirstTime() async {
    bool isFirst = LocalStorageService.getFirstTime();
    emit(SplashState(isFirstTime: isFirst));
  }

  Future<void> setFirstTimeFalse() async {
    await LocalStorageService.saveFirstTime(false);
    emit(SplashState(isFirstTime: false));
  }


  Future<void> navigateAfterSplash(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));

    if (state.isFirstTime) {
      Get.toNamed('/splash1v1');
    } else {
      Get.toNamed('/Login_screen');
    }
  }

  Future<void> completeSplashSequence(BuildContext context) async {
    await setFirstTimeFalse();
    Get.toNamed('/Login_screen');
  }
}
