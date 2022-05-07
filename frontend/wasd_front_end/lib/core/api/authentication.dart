import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wasd_front_end/app/routes/apiroutes.dart';

class AuthenticationAPI {
  final client = http.Client();
  // Create new user
  Future signUp({ required String username, required String useremail, required String userpassword, required String userimage,}) async {
    String subUrl = "/user/signup";
    final Uri uri = Uri.parse(APIRoutes.BaseUrl + subUrl);
    // ignore: avoid_print
    print(uri);
    final http.Response response = await client.post(uri,
    body: jsonEncode({
      "username" :username,
      "useremail" : useremail,
      "userpassword" : userpassword,
      "userimage" : userimage,
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

  Future decodeJwt({required dynamic token}) async {
    String subUrl = "/user/decode-jwt";
    final Uri uri = Uri.parse(APIRoutes.BaseUrl + subUrl);
    final http.Response response = await client.get(uri,
    headers: {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
      "Authorization" : token
    });
    final statusCode = response.statusCode;
    final body = response.body;
    if(statusCode == 200){
      return body;
    }
  }
}