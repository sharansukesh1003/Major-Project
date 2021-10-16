import 'package:wasd_front_end/views/authentication/login.dart';
import 'package:wasd_front_end/views/authentication/signup.dart';
import 'package:wasd_front_end/views/decider_view/deciderview.dart';
import 'package:wasd_front_end/views/home_view/homeview.dart';
import 'package:wasd_front_end/views/splash_view/splashview.dart';

// ignore: non_constant_identifier_names, constant_identifier_names
const String LoginRoute = "/login";
// ignore: constant_identifier_names, non_constant_identifier_names
const String SignUpRoute = "/signup";
// ignore: constant_identifier_names, non_constant_identifier_names
const String HomeRoute = "/home";
// ignore: constant_identifier_names
const String DeciderRoute = "/decider";
// ignore: constant_identifier_names
const String SplashRoute = "/splash";

final routes = {
  LoginRoute : (context) => LoginView(),
  SignUpRoute : (context) => SignUpView(),
  HomeRoute : (context) => HomeView(),
  DeciderRoute : (context) => DeciderView(),
  SplashRoute : (context) => SplashView()
};