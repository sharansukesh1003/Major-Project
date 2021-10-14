import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/core/api/authentication.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';

class AuthenticationNotifier extends ChangeNotifier {
  // ignore: unnecessary_new
  final AuthenticationAPI _authenticationAPI = new AuthenticationAPI();
  // ignore: unnecessary_new
  final CacheService cacheService = new CacheService();
  Future signUp({required String name,required String email,required String password,required BuildContext context}) async{
    try{ 
      var userData = await _authenticationAPI.signUp(name: name, email: email, password: password);
      final Map<String,dynamic> parsedValue = await json.decode(userData);
      final userJwt = parsedValue['message'];
      final userCode = parsedValue['code'];
      if(userCode == 201){
        cacheService.writeCache(key: "jwt", value: userJwt);
        Navigator.of(context).pushNamed(HomeRoute);
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(userJwt)));
      }
    }
    catch(error){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong")));
    }
  }
  Future login({required String email,required String password,required BuildContext context}) async{
      try{ 
        var userData = await _authenticationAPI.login(email: email, password: password);
        final Map<String,dynamic> parsedValue = await json.decode(userData);
        final userJwt = parsedValue['message'];
        final userCode = parsedValue['code'];
        if(userCode == 201){
          cacheService.writeCache(key: "jwt", value: userJwt);
          Navigator.of(context).pushNamed(HomeRoute);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(userJwt)));
        }
    }
    catch(error){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong")));
    }
  }
}