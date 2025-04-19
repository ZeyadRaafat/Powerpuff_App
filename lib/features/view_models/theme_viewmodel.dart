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
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black54),
            titleLarge: TextStyle(color: mojocolor, fontWeight: FontWeight.bold),
            // Add more text styles for better dark theme support
            displayLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(color: Colors.black),
            displaySmall: TextStyle(color: Colors.black),
          ),
        );
        break;

      case "Blossom":
        newTheme = ThemeData(
          primaryColor: blossomcolor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: blossomcolor),
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black54),
            titleLarge: TextStyle(color: mojocolor, fontWeight: FontWeight.bold),
            // Add more text styles for better dark theme support
            displayLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(color: Colors.black),
            displaySmall: TextStyle(color: Colors.black),
          ),
        );
        break;

      case "Buttercup":
        newTheme = ThemeData(
          primaryColor: buttercupcolor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: buttercupcolor),
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black54),
            titleLarge: TextStyle(color: mojocolor, fontWeight: FontWeight.bold),
            // Add more text styles for better dark theme support
            displayLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(color: Colors.black),
            displaySmall: TextStyle(color: Colors.black),
          ),
          cardColor: Colors.white,
          indicatorColor: Colors.black
        );
        break;

      case "Mojo":
        newTheme = ThemeData(
          indicatorColor: Colors.white,
          brightness: Brightness.dark, // Set to dark theme
          primaryColor: mojocolor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: mojocolor),
          ),
          scaffoldBackgroundColor: Color(0xFF121212), // Darker background for true dark theme
          cardColor: Color(0xFF1E1E1E), // Darker card color
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF1A1A1A), // Darker app bar
            iconTheme: IconThemeData(color: mojocolor),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white70),
            titleLarge: TextStyle(color: mojocolor, fontWeight: FontWeight.bold),
            // Add more text styles for better dark theme support
            displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(color: Colors.white),
            displaySmall: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: mojocolor),
          dividerColor: Color(0xFF303030), // Darker divider
          buttonTheme: ButtonThemeData(buttonColor: mojocolor),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: mojoAccent,
            foregroundColor: Colors.black,
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: WidgetStateProperty.resolveWith((states) => mojocolor),
          ),
          dialogBackgroundColor: Color(0xFF1E1E1E), // Dark dialog background
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF1A1A1A),
            selectedItemColor: mojocolor,
            unselectedItemColor: Colors.grey,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color(0xFF2C2C2C),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3C3C3C)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mojocolor),
              borderRadius: BorderRadius.circular(8),
            ),
            labelStyle: TextStyle(color: Colors.white70),
            hintStyle: TextStyle(color: Colors.white38),
          ),
          colorScheme: ColorScheme.dark(
            primary: mojocolor,
            secondary: mojoAccent,
            surface: Color(0xFF1E1E1E),
            error: Colors.redAccent,
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
