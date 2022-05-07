import 'dart:ui';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/services/post_service.dart';
import 'package:wasd_front_end/core/services/profile_service.dart';
import 'package:wasd_front_end/views/add_posts/post_view.dart';
import 'package:wasd_front_end/views/profile_view/detailed_game_view.dart';
import 'package:wasd_front_end/views/profile_view/settings.dart';

class ProfileView extends StatefulWidget {

  const ProfileView({ Key? key }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  Map <String, dynamic> data = {};
  Map <String, dynamic> userPosts = {};
  bool _loading = true;
  
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  Future <dynamic> getProfileData() async {
    var response = await ProfileAPI.fetchProfile();
    var posts = await PostsAPI.fetchPost();
    data = response;
    userPosts = posts;
    setState(() {
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return _loading ? const Center(
              child: CircularProgressIndicator(
                color: ConstantColors.secondaryColor,
              ),
            ) : Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstantColors.secondaryColor,
        onPressed: () {
          Navigator.push(context, 
          PageTransition(child: AddPost(), type: PageTransitionType.rightToLeft));
        },
        child: const Icon(Icons.add, size: 40,),
      ),
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: const Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85),
        actions: <Widget> [
          IconButton(
          onPressed: () {
            Navigator.push(context, PageTransition(
              child: const SettingsView(),
              type: PageTransitionType.rightToLeft
            ));
          },
          icon: const Icon(
            Icons.settings,
            size: 30,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getProfileData,
        color: Colors.white,
        backgroundColor: ConstantColors.secondaryColor,
        strokeWidth: 2.5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 53,
                    backgroundColor: ConstantColors.secondaryColor,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.network(data['profilePicture'] == 'none' ? 
                        'https://res.cloudinary.com/df8qz9hlx/image/upload/v1651752696/wasd/default_rcmogi.jpg' : 
                        data['profilePicture'], fit: BoxFit.cover)
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(data['username'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(data['description'] == 'none' ?  'Please enter ur description here, by going into profile settings and adding description.' : data['description'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16
                          ),
                        )
                    ],
                                ),
                  ),
              ],
                    ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailedView(name : "Games", subName: "Played", data: data['gamesPlayed'] ?? ['No games foud'],),
                                  type: PageTransitionType.rightToLeft),
                            );
                        },
                      child: Column(
                      children: [
                        Text(data['gamesPlayed'] == null ? '0' : data['gamesPlayed'].length.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                        ),
                                        ),
                        const Text("Games \nPlayed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18
                        ),
                        )
                      ],
                                    ),
                    ),
                  GestureDetector(
                    onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailedView(name : "Recommended", subName: "Games", data: data['recommendedGames'] ?? ['No games foud']),
                                  type: PageTransitionType.rightToLeft),
                            );
                        },
                    child: Column(
                      children: [
                        Text(data['recommendedGames'] == null ? '0' : data['recommendedGames'].length.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                        const Text("Recommended \nGames",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18
                        ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(data['mostlyPlayed'] == null ? 'None' : data['mostlyPlayed'].toString().toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                      const Text("Most \nPlayed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 18
                      ),
                      )
                    ],
                  ),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Post's",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white
                        ),
                        ),
                        Container(
                          height: 3,
                          width: 55,
                          color: ConstantColors.secondaryColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: userPosts['posts'].length == 0 ? 
                const Center(child: Text("No Posts Found", style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),) : 
                GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {  
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(userPosts['posts'][index]['photo'], fit: BoxFit.cover,)
                        ),
                      );
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                      ),
                    itemCount: userPosts['posts'].length,
                  )
              )
          ],
        ),
      ),
    );
  }
}
