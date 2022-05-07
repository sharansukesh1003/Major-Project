// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/services/post_service.dart';
import 'package:wasd_front_end/widgets/post_card.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  Map <String, dynamic> data = {};
  bool _loading = true;

  @override
  void initState() { 
    getFeedPosts();
    super.initState();
  }

  Future<dynamic> getFeedPosts() async {
    var response = await PostsAPI.fetchFeedPost();
    data = response;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: const Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85,),
        actions: <Widget> [
          IconButton(
          onPressed: () {},
          icon: const Icon(Icons.message_outlined),
        ),
        ],
      ),
      body: _loading ? const Center(
              child: CircularProgressIndicator(
                color: ConstantColors.secondaryColor,
              ),
            ) : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: data['posts'].length == 0 ? const Center(child: Text("No Posts Found", style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),) : 
                  ListView.builder(
           reverse: true,
           physics: const BouncingScrollPhysics(),
           shrinkWrap: true,
           itemCount: data['posts'].length,
           itemBuilder: (context, index) {
             return PostCard(
                user: data['posts'][index]['username'],
                title: data['posts'][index]['title'],
                imageUrl: data['posts'][index]['photo'], 
                likes: data['posts'][index]['likes'].length, 
                profileImageUrl: data['posts'][index]['userProfilePic'] == 'none' ? 'https://res.cloudinary.com/df8qz9hlx/image/upload/v1651752696/wasd/default_rcmogi.jpg' : data['posts'][index]['userProfilePic'], 
                comments: data['posts'][index]['comments'].length
          );
        }),
      ),
    );
  }
}
