// ignore_for_file: avoid_print
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
  Future signUp(
    {required String username,
    required String useremail,
    required String userpassword,
    required String userimage,
    required BuildContext context
    }) async{
    try{ 
      var userData = await _authenticationAPI.signUp(username: username, useremail: useremail, userpassword: userpassword, userimage: userimage);
      final Map<String,dynamic> parsedValue = await json.decode(userData);
      final userJwt = parsedValue['message'];
      final userCode = parsedValue['code'];
      if(userCode == 201){
        cacheService.writeCache(key: "jwt", value: userJwt);
        Navigator.of(context).pushNamedAndRemoveUntil(HomeRoute, (Route route) => false);
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
          Navigator.of(context).popAndPushNamed(HomeRoute);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(userJwt)));
        }
    }
    catch(error){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong")));
    }
  }
  Future decodeJwt({required dynamic token}) async {
    try{
      var response = await _authenticationAPI.decodeJwt(token: token);
      return response;
    }
    catch(error){
      print(error);
    }
  }
  Future <String> fetchUserEmail({required BuildContext context}) async {
    var token = await cacheService.readCache(key: "jwt");
    var dataToken = await decodeJwt(token: token);
    final Map<String,dynamic> parsedDataToken = await jsonDecode(dataToken);
    final userEmail = parsedDataToken["message"];
    print(userEmail);
    return userEmail;
  }
}