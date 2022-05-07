import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wasd_front_end/core/model/news_model.dart';
import 'package:wasd_front_end/core/services/base_url.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';

class NewsApi {

  List<NewsModel> newsDataList = [];

  Future<void> getNewsData() async {
    CacheService cacheService = CacheService();
    var token = await cacheService.readCache(key: "jwt");
    var client = http.Client();
    var url = Uri.http(Config.apiUrl, Config.newsAPI);
    Map<String, String> headers = {
      'Content-type' : 'application/json',
      'Authorization': "Bearer $token",
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*",
    };
    var response = await client.get(url, headers: headers);
    var jsonData = json.decode(response.body);
    int count = 0;
    if (response.statusCode == 200) {
      jsonData['data']['articles'].forEach((i) {
        if (count == 5) return;
        if (i['title'] != null && i['image'] != null) {
          NewsModel newsData = NewsModel(
              image: i['image'],
              title: i['title'],
              description: i['description'],
              url: i['url']);
          newsDataList.add(newsData);
        }
        count++;
      });
    }
  }
}
