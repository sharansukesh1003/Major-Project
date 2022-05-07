import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wasd_front_end/core/services/base_url.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';

class MatchMaking {

  static Future<dynamic> recentlyJoined() async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.recentlyJoinedPlayersAPI );
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

  static Future<dynamic> suggestedPlayers() async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var id = await cacheService.readCache(key: "id");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.defaultSuggestionAPI + id);
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

  static Future<dynamic> searchPlayers(String reason, 
  String age, 
  String experience,
  String game,
  String language,
  String nationality,
  String region,
  String gender ) async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.searchPlayersAPI);
    Map <String, String> headers = {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
      "Authorization" : "Bearer $token"
    };
    var body = jsonEncode({
      'reason' : reason, 
      'age' : age,
      'experience' : experience,
      'game' : game,
      'language' : language ,
      'nationality' : nationality,
      'region' : region ,
      'gender' : gender
    });
    var response = await client.post(url, headers: headers, body: body);
    var jsonData = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) return jsonData;
  }

}