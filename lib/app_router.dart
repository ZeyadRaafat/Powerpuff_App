import 'package:Powerpuff/view/screens/homePage.dart';
import 'package:Powerpuff/view/screens/login&sign/Loginscreen.dart';
import 'package:Powerpuff/view/screens/login&sign/Signupscreen.dart';
import 'package:Powerpuff/view/screens/splash/mainsplash.dart';
import 'package:Powerpuff/view/screens/splash/splash1_v1.dart';
import 'package:Powerpuff/view/screens/splash/splash1_v2.dart';
import 'package:Powerpuff/view/screens/splash/splash1_v3.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'view/screens/Homescreen/Homemain.dart';

class AppRouter {
  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/splash1v1', page: () => Splash1V1()),
    GetPage(name: '/splash1v2', page: () => Splash1V2()),
    GetPage(name: '/splash1v3', page: () => Splash1V3()),
    GetPage(name: '/Login_screen', page: () => LoginScreen()),
    GetPage(name: '/Signup_screen', page: () => SignupScreen()),
    GetPage(name: '/Home_main', page: () => Homemain()),
  ];
}
