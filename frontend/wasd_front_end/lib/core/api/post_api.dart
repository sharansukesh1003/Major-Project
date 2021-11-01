// ignore_for_file: non_constant_identifier_names, avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wasd_front_end/app/routes/apiroutes.dart';
import 'package:wasd_front_end/core/dto/post_dto.dart';

class PostAPI{
  final client = http.Client();
  final header = {
    'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Access-Control-Allow-Origin" : "*"
  };
  // Create new user
  Future addPost(PostDTO postDTO) async {
    String subUrl = "/post/add/${postDTO.useremail}";
    final Uri uri = Uri.parse(APIRoutes.BaseUrl + subUrl);
    try{
      final http.Response response = await client.post(uri,
      body: jsonEncode(postDTO.toJson()),headers: header);
      final statusCode = response.statusCode;
      final body = response.body;
      print(body);
      if(statusCode == 200){
        return body;
        }
    }
    catch(error){
      print(error.toString());
    }
  }
  Future fetchPost() async {
    String subUrl = "/post/";
    final Uri uri = Uri.parse(APIRoutes.BaseUrl + subUrl);
    try{
      final http.Response response = await client.get(uri,
      headers: header);
      final statusCode = response.statusCode;
      final body = response.body;
      print(body);
      if(statusCode == 200){
        return body;
      }
    }
    catch(error){
      print(error.toString());
    }
  }
}
