import 'package:flutter/material.dart';
import 'package:vantech/main.dart';
import 'package:vantech/page/signuppage.dart';
import 'package:vantech/dasboard page/dashboard.dart';
import 'package:vantech/page/forgotpass.dart';
import 'package:vantech/profil/profil.dart';
import 'package:vantech/page/signinpage.dart';
import 'package:vantech/profil/editpage.dart';

class AppRoutes {
  static const String welcomePage = '/welcome_page';
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/register_screen';
  static const String dashboardScreen = '/dashboard_screen';
  static const String forgetPasswordScreen = '/forget_password_screen';
  static const String profileScreen = '/profile_screen';
  static const String editProfileScreen = '/edit_profile_screen';
  static Map<String, WidgetBuilder> routes = {
    welcomePage: (context) => const HygieneHeroesApp(),
    loginScreen: (context) => const SignInPage(),
    registerScreen: (context) => const SignUpPage(),
    dashboardScreen: (context) => const HomePage(),
    forgetPasswordScreen: (context) => const ForgotPasswordScreen(),
    profileScreen: (context) => const ProfilePage(),
    editProfileScreen: (context) => const EditProfilePage(),
  };
}
