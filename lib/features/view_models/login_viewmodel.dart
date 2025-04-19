import 'package:Powerpuff/core/services/local_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../models/log_model.dart';
import 'user_viewmodel.dart';

class LoginViewModel extends GetxController {
  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();
  Dio dio = Dio();

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      var response = await dio.post(
        '$Baseurl/v1/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data != null) {
        loginModel.value = LoginModel.fromJson(response.data);
        await LocalStorageService.saveLoginState(true);

        // Set user data in UserViewModel
        if (loginModel.value?.data?.user != null) {
          final userViewModel = Get.find<UserViewModel>();
          userViewModel.setCurrentUser(loginModel.value!.data!.user);
          // Save username to local storage for persistence
          await LocalStorageService.saveString('username', loginModel.value!.data!.user.name);
        }

        Get.snackbar(
          "Success",
          "Logged in successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: buttercupcolor,
          colorText: Colors.white,
        );
        Get.toNamed('/home');
      } else {
        Get.snackbar(
          "Error",
          'Email or Password is incorrect',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: blossomcolor,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: blossomcolor,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
