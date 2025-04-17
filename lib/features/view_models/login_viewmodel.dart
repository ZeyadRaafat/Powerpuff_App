import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../models/log_model.dart';

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
        Get.snackbar(
          "Success",
          "Logged in successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: buttercupcolor,
          colorText: Colors.white,
        );
        Get.toNamed('/Home_main');
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
