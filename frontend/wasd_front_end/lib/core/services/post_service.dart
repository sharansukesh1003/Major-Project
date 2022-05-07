import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wasd_front_end/core/services/base_url.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';

class PostsAPI {

  static Future<dynamic> post(String title, String photo, String id) async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var client = http.Client();
    var profUrl = Uri.http(Config.apiUrl, Config.getProfileAPI + id);
    var url = Uri.http(Config.apiUrl, Config.postUploadAPI);
    Map <String, String> headers = {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
      "Authorization" : "Bearer $token"
    };
    var res = await client.get(profUrl, headers: headers);
    var userData = json.decode(res.body) as Map<String, dynamic>;
    var body = jsonEncode({
      'title' : title,
      'photo' : photo,
      'id' : id,
      'username' : userData['username'],
      'userProfilePic' : userData['profilePicture']
    });
    var response = await client.post(url, headers: headers, body: body);
    var jsonData = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) return jsonData;
  }

  static Future<dynamic> profilePic(String picture) async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var id = await cacheService.readCache(key: "id");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.profilePictureAPI);
    Map <String, String> headers = {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
      "Authorization" : "Bearer $token"
    };
    var body = jsonEncode({
      'picture' : picture,
      'userId' : id
    });
    var response = await client.put(url, headers: headers, body: body);
    var jsonData = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) return jsonData;
  }

  static Future<dynamic> fetchPost() async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var id = await cacheService.readCache(key: "id");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.getPostsAPI + id);
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

  static Future<dynamic> fetchFeedPost() async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.getFeedPostsAPI);
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

}