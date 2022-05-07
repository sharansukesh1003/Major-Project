// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/services/player_matchmaking.dart';
import 'package:wasd_front_end/views/search_view/custom_search_view.dart';
import 'package:wasd_front_end/widgets/suggested_players.dart';

class SearchView extends StatefulWidget {

  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  Map <String, dynamic> data = {};
  Map <String, dynamic> suggestedData = {};
  bool _loading = true;

  @override
  void initState() {
    recentlyJoined();
    super.initState();
  }

  Future<dynamic> recentlyJoined() async {
    var response = await MatchMaking.recentlyJoined();
    var res = await MatchMaking.suggestedPlayers();
    suggestedData = res;
    data = response;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: const Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85),
        actions: <Widget> [
          IconButton(
          onPressed: () {
            Navigator.push(context, PageTransition(
              child: CustomSearch(),
              type: PageTransitionType.rightToLeft
            ));
          },
          icon: const Icon(
            Icons.search,
            size: 30,
            ),
          ),
        ],
      ),
     backgroundColor: ConstantColors.primaryColor,
     body: SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       child: Column(
         children: [
           SizedBox(height: 5),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: const [
                Text(
                   "Suggested Player's",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                        ),
                    ),
                  ],
                ),
              ),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
               child: Row(
                 children: [
                   Container(
                        height: 3.0,
                        width: 150.0,
                        color: ConstantColors.secondaryColor,
                    ),
                 ],
               ),
             ),
             _loading ? const Center(
              child: CircularProgressIndicator(
                color: ConstantColors.secondaryColor,
              ),
            ) : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
             physics: const BouncingScrollPhysics(),
             shrinkWrap: true,
             itemCount: suggestedData['data'].length < 5 ? suggestedData['data'].length : 4,
             itemBuilder: (context, index) {
               return PlayerCard(
                 userName: 
                 suggestedData['data'][index]['username'], 
                 profileImageUrl: suggestedData['data'][index]['profilePicture'] == 'none' ? 'https://res.cloudinary.com/df8qz9hlx/image/upload/v1651752696/wasd/default_rcmogi.jpg' : suggestedData['data'][index]['profilePicture'], 
                 bio: suggestedData['data'][index]['description']);
          }),
        ),
      ),
             Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: const [
                Text(
                   "Recently Joined",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                        ),
                    ),
                  ],
                ),
              ),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
               child: Row(
                 children: [
                   Container(
                        height: 3.0,
                        width: 130.0,
                        color: ConstantColors.secondaryColor,
                    ),
                 ],
               ),
             ),
             _loading ? const Center(
              child: CircularProgressIndicator(
                color: ConstantColors.secondaryColor,
              ),
            ) : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
             physics: const BouncingScrollPhysics(),
             shrinkWrap: true,
             itemCount: 5,
             itemBuilder: (context, index) {
               return PlayerCard(
                 userName: 
                 data['users'][index]['username'], 
                 profileImageUrl: data['users'][index]['profilePicture'] == 'none' ? 'https://res.cloudinary.com/df8qz9hlx/image/upload/v1651752696/wasd/default_rcmogi.jpg' : data['users'][index]['profilePicture'], 
                 bio: data['users'][index]['description']);
          }),
        ),
      ),
         ],
       ),
     )
   );
  }
}
