import 'dart:convert';

import 'package:Powerpuff/view/screens/login&sign/Loginscreen.dart';
import 'package:Powerpuff/view/screens/login&sign/Signupscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../models/signup_model.dart';

class SignupViewModel extends GetxController {
  var isLoading = false.obs;
  var registerModel = Rxn<RegisterModel>();
  late final Dio _dio;

  SignupViewModel() {
    _dio = Dio();
  }

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      // Log registration attempt
      print('Attempting to register user: $email');
      
      final response = await _dio.post(
        '$Baseurl/v1/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      print('Registration response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        // Dio already parses the JSON response
        final responseData = response.data;
        
        if (responseData['status'] == 'SUCCESS') {
          // Store token if needed
          var token = responseData['data']['token'];
          
          Get.snackbar(
            'Registration Successful',
            'Welcome, $name!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            borderRadius: 10,
            margin: EdgeInsets.all(10),
            duration: Duration(seconds: 3),
            icon: Icon(Icons.check_circle, color: Colors.white),
          );
          
          // Navigate to login screen after successful registration
          Get.offAllNamed('/Login_screen');
        }
      } else {
        // Handle API errors
        final errorMsg = response.data?['message'] ?? 'Registration failed';
        Get.snackbar(
          'Error',
          errorMsg,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: blossomcolor,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Handle API errors with detailed messages
      String errorMessage= 'Something went wrong. Please try again.';
      
      if (e is DioException) {
        // Extract error message from DioException
        print('DioException during registration: ${e.type}, Status: ${e.response?.statusCode}');
        if (e.response != null) {
          // Check specifically for 503 Service Unavailable error
          if (e.response!.statusCode == 503) {
            errorMessage = 'Server is temporarily unavailable, please try again later';
            print('503 Service Unavailable error encountered during registration');
          } else if (e.response!.data is Map<String, dynamic>) {
            // Try to get the error message from the response data
            final responseData = e.response!.data as Map<String, dynamic>;
            
            if (responseData.containsKey('message')) {
              errorMessage = responseData['message'];
            } else if (responseData.containsKey('error')) {
              errorMessage = responseData['error'];
            } else if (responseData.containsKey('data') && responseData['data'] is List) {
              // Extract validation errors if available
              final dataList = responseData['data'] as List;
              if (dataList.isNotEmpty && dataList[0] is Map<String, dynamic>) {
                final firstError = dataList[0] as Map<String, dynamic>;
                if (firstError.containsKey('msg')) {
                  errorMessage = firstError['msg'];
                }
              }
            }
          } else if (e.response!.data is String) {
            errorMessage = e.response!.data;
          }
        } else if (e.error != null) {
          // Network errors
          errorMessage = 'Network error: ${e.error.toString()}';
        }
      }
      
      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: blossomcolor,
        colorText: Colors.white,
      );
      print('Registration error: $e');
    }
    finally {
      isLoading.value = false;
    }
  }
}
