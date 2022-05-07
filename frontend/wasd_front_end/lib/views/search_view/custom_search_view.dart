import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/services/player_matchmaking.dart';
import 'package:wasd_front_end/views/search_view/search_result.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({ Key? key }) : super(key: key);

  final gameNameController = TextEditingController();
  final languageController = TextEditingController();
  final reasonToPlayController = TextEditingController();
  final experienceController = TextEditingController();
  final nationalityController = TextEditingController();
  final regionController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.primaryColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 16.0,
                    color: Colors.white,
                  ),
                enableSuggestions: false,
                autocorrect: false,
                controller: gameNameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  hintStyle: TextStyle(
                    color: Colors.white54
                    ),
                  hintText: "game name",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                  fillColor: Colors.white,
                 ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 16.0,
                    color: Colors.white,
                  ),
                enableSuggestions: false,
                autocorrect: false,
                controller: reasonToPlayController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  hintStyle: TextStyle(
                    color: Colors.white54
                    ),
                  hintText: "reason to play",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                  fillColor: Colors.white,
                 ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 16.0,
                    color: Colors.white,
                  ),
                enableSuggestions: false,
                autocorrect: false,
                controller: experienceController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  hintStyle: TextStyle(
                    color: Colors.white54
                    ),
                  hintText: "experience",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                  fillColor: Colors.white,
                 ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 16.0,
                    color: Colors.white,
                  ),
                enableSuggestions: false,
                autocorrect: false,
                controller: languageController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  hintStyle: TextStyle(
                    color: Colors.white54
                    ),
                  hintText: "language",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                  fillColor: Colors.white,
                 ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 16.0,
                    color: Colors.white,
                  ),
                enableSuggestions: false,
                autocorrect: false,
                controller: nationalityController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  hintStyle: TextStyle(
                    color: Colors.white54
                    ),
                  hintText: "nationality",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                  fillColor: Colors.white,
                 ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 16.0,
                    color: Colors.white,
                  ),
                enableSuggestions: false,
                autocorrect: false,
                controller: genderController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  hintStyle: TextStyle(
                    color: Colors.white54
                    ),
                  hintText: "gender",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                  fillColor: Colors.white,
                 ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 16.0,
                    color: Colors.white,
                  ),
                enableSuggestions: false,
                autocorrect: false,
                controller: ageController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  hintStyle: TextStyle(
                    color: Colors.white54
                    ),
                  hintText: "age",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                  fillColor: Colors.white,
                 ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 16.0,
                    color: Colors.white,
                  ),
                enableSuggestions: false,
                autocorrect: false,
                controller: regionController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                  hintStyle: TextStyle(
                    color: Colors.white54
                    ),
                  hintText: "region",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                  fillColor: Colors.white,
                 ),
               ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              color: ConstantColors.secondaryColor,
              child: SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                      ),
                    Text("Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                  ],
                ),
              ),
                onPressed: () async {
                    var data = await MatchMaking.searchPlayers(
                    reasonToPlayController.text, 
                    ageController.text, 
                    experienceController.text, 
                    gameNameController.text.toLowerCase(), 
                    languageController.text.toLowerCase(), 
                    nationalityController.text.toLowerCase(), 
                    regionController.text, 
                    genderController.text.toLowerCase());
                    Navigator.push(
                            context,
                            PageTransition(
                                child: SearchResult(data: data,),
                                type: PageTransitionType.rightToLeft),
                          );
                }
              ),
          ],
        ),
      ),
    );
  }
}