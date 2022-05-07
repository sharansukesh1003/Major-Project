import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wasd_front_end/core/services/base_url.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';

class ProfileAPI {
  
  static Future<dynamic> fetchProfile() async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var id = await cacheService.readCache(key: "id");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.getProfileAPI + id);
    Map <String, String> headers = {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
      "Authorization" : "Bearer $token"
    };
    var response = await client.get(url, headers: headers);
    var jsonData = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) return jsonData;
  }

  static Future<dynamic> addAge(int age) async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var id = await cacheService.readCache(key: "id");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.playerAgeAPI);
    Map <String, String> headers = {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
      "Authorization" : "Bearer $token"
    };
    var body = jsonEncode({
      'age' : age,
      'userId' : id
    });
    var response = await client.put(url, headers: headers, body: body);
    var jsonData = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) return jsonData;
  }

}