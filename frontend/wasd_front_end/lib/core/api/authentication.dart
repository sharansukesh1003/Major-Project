import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wasd_front_end/app/routes/apiroutes.dart';

class AuthenticationAPI{
  final client = http.Client();
  // Create new user
  Future signUp({required String name,required String email,required String password}) async {
    String subUrl = "/user/signup";
    final Uri uri = Uri.parse(APIRoutes.BaseUrl + subUrl);
    // ignore: avoid_print
    print(uri);
    final http.Response response = await client.post(uri,
    body: jsonEncode({
      "username" : name,
      "useremail" : email,
      "userpassword" : password,
    }),
    headers: {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*"
    });
    final statusCode = response.statusCode;
    final body = response.body;
    // ignore: avoid_print
    print(body);
    if(statusCode == 200){
      return body;
    }
  }
  Future login({required String email,required String password}) async {
    String subUrl = "/user/login";
    final Uri uri = Uri.parse(APIRoutes.BaseUrl + subUrl);
    // ignore: avoid_print
    print(uri);
    final http.Response response = await client.post(uri,
    body: jsonEncode({
      "useremail" : email,
      "userpassword" : password,
    }),
    headers: {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*"
    });
    // ignore: avoid_print
    print(response);
    final statusCode = response.statusCode;
    final body = response.body;
    // ignore: avoid_print
    print(body);
    if(statusCode == 200){
      return body;
    }
  }
}