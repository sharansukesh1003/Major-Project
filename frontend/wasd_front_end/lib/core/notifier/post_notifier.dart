// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/core/api/post_api.dart';

import 'authentication_notifier.dart';

class PostNotifier extends ChangeNotifier{
  final PostAPI _postAPI = PostAPI();
  Future addPost({
    required BuildContext context,
    required String post_title
  }) async{
    try{
      final authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
      var user_email = await authenticationNotifier.fetchUserEmail(context: context);
      var response = await _postAPI.addPost(post_title: post_title, useremail: user_email);
      print(response);
    }
    catch(error){
      print(error);
    }
  }
}