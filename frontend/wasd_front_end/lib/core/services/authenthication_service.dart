import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wasd_front_end/core/model/authentication_message.dart';
import 'package:wasd_front_end/core/services/base_url.dart';

class Authentication {

  static Future<dynamic> login(String email, String password) async {
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.loginAPI);
    Map <String, String> headers = {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
    };
    var body = jsonEncode({
      'email' : email,
      'password' : password
    });
    var response = await client.post(url, headers: headers, body: body);
    var jsonData = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return LoginMessageSuccess(message: jsonData['message'], token: jsonData['token'], authentication: jsonData['authentication'], id :jsonData['id']);
    }
    else {
      return LoginMessageFail(message: jsonData['message'], authentication: jsonData['authentication']);
    }
  }

  static Future<dynamic> signUp(String email, String username, String password) async {
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.signupAPI);
    Map <String, String> headers = {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
    };
    var body = jsonEncode({
      'name' : username,
      'email' : email,
      'password' : password
    });
    var response = await client.post(url, headers: headers, body: body);
    var jsonData = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return SignUpMessage(message: jsonData['message'], success: jsonData['success']);
    }
    else {
      return SignUpMessage(message: jsonData['message'], success: jsonData['success']);
    }
  }

}