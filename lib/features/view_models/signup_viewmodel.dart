import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:Powerpuff/core/services/local_storage_service.dart';
import '../models/signup_model.dart';

class SignupViewModel extends GetxController {
  // Input fields (Reactive)
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  // States
  var isLoading = false.obs;
  var registerModel = Rxn<RegisterModel>();

  final Dio _dio = Dio();

  /// Validates the input fields and shows snackbars if needed
  bool _validateInputs() {
    if (name.value.trim().isEmpty || email.value.trim().isEmpty || password.value.isEmpty) {
      Get.snackbar(
        'Error',
        'All fields are required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: blossomcolor,
        colorText: Colors.white,
      );
      return false;
    }
    if (!GetUtils.isEmail(email.value.trim())) {
      Get.snackbar(
        'Error',
        'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: blossomcolor,
        colorText: Colors.white,
      );
      return false;
    }
    if (password.value.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: blossomcolor,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  /// Handles the registration process
  Future<void> registerUser() async {
    if (!_validateInputs()) return;

    isLoading.value = true;

    try {
      final response = await _dio.post(
        '$Baseurl/v1/auth/register', // ✅ no backslash
        data: {
          'name': name.value.trim(),
          'email': email.value.trim(),
          'password': password.value,
        },
      );

      final status = response.statusCode;
      final data = response.data;

      if ((status == 200 || status == 201) && data is Map) {
        registerModel.value = RegisterModel.fromJson(Map<String, dynamic>.from(data));
        final msg = registerModel.value!.message ?? 'Registered successfully!';

        Get.snackbar(
          'Success',
          msg,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: buttercupcolor,
          colorText: Colors.white,
        );

        await LocalStorageService.saveLoginState(true);
        Get.offAllNamed('/home');
      } else if (data is Map && data['message'] != null) {
        Get.snackbar(
          'Error',
          data['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: blossomcolor,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Registration failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: blossomcolor,
          colorText: Colors.white,
        );
      }
    } on DioError catch (e) {
      String errorMessage = 'Something went wrong. Please try again.';
      if (e.response?.data is Map && e.response?.data['message'] != null) {
        errorMessage = e.response!.data['message'];
      }
      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: blossomcolor,
        colorText: Colors.white,
      );
    } catch (_) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: blossomcolor,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
