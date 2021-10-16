// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';
import 'package:wasd_front_end/views/home_view/homeview.dart';
import 'package:wasd_front_end/views/introduction/introductionview.dart';

// ignore: use_key_in_widget_constructors
class DeciderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    final CacheService cacheService = new CacheService();
    return FutureBuilder(
      future: cacheService.readCache(key: "jwt"),
      builder: (context,snapshot){
        if(snapshot.hasData){
          print("home");
          return HomeView();
        }
        else{
          print("login");
          return IntroductionView();
        }
      });
  }
}