import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Powerpuff/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeViewModel extends GetxController {
  late SharedPreferences _prefs;
  var currentTheme = ThemeData.light().obs;

  @override
  void onInit (){
    super.onInit();
    _loadTheme();
  }

  Future<void> changeTheme(String themeName) async {
    ThemeData newTheme;
    switch (themeName) {
      case "Bubbels":
        newTheme = ThemeData(
          primaryColor: bubbelscolor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: bubbelscolor),
          ),
        );
        break;

      case "Blossom":
        newTheme = ThemeData(
          primaryColor: blossomcolor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: blossomcolor),
          ),
        );
        break;

      case "Buttercup":
        newTheme = ThemeData(
          primaryColor: buttercupcolor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: buttercupcolor),
          ),
        );
        break;

      default:
        newTheme=ThemeData.light();
    }
    currentTheme.value=newTheme;
    _prefs= await SharedPreferences.getInstance();
    await _prefs.setString('selectedTheme', themeName);
  }

  Future<void> _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    String savedTheme = _prefs.getString('selectedTheme') ?? "Bubbels";
    changeTheme(savedTheme);
  }
}
