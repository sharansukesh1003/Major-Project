// ignore_for_file: constant_identifier_names
import 'package:wasd_front_end/views/add_posts/post_view.dart';
import 'package:wasd_front_end/views/authentication_view/login.dart';
import 'package:wasd_front_end/views/authentication_view/signup.dart';
import 'package:wasd_front_end/views/decider_view/deciderview.dart';
import 'package:wasd_front_end/views/home_view/homeview.dart';
import 'package:wasd_front_end/views/main_screen/parent_screen.dart';
import 'package:wasd_front_end/views/splash_view/splashview.dart';

const String LoginRoute = "/login";
const String SignUpRoute = "/signup";
const String HomeRoute = "/home";
const String DeciderRoute = "/decider";
const String SplashRoute = "/splash";
const String AddPostRoute = "/add-post";
const String MainRoute = "/main_screen";

final routes = {
  LoginRoute : (context) => LoginView(),
  MainRoute : (context) => const MainScreen(),
  SignUpRoute : (context) => SignUpView(),
  HomeRoute : (context) => HomeView(),
  DeciderRoute : (context) => DeciderView(),
  SplashRoute : (context) => SplashView(),
  AddPostRoute : (context) => AddPost()
};