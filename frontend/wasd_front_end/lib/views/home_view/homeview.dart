import 'package:flutter/material.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CacheService cacheService = CacheService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          cacheService.deleteCache(key: "jwt").whenComplete(() => 
          Navigator.of(context).pushNamed(LoginRoute)
          );
        },
      ),
    );
  }
}