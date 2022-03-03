// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/widgets/suggested_players.dart';

class SearchView extends StatelessWidget {

  const SearchView();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: const Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85),
        actions: <Widget> [
          IconButton(
          onPressed: () {},
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
             PlayerCard(
             userName: 'Sukuna', 
             profileImageUrl: 'lib/static/max.jpg',
             bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
             PlayerCard(
             userName: 'Decoy', 
             profileImageUrl: 'lib/static/decoy.jpg',
             bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'),
             PlayerCard(
             userName: 'Trident', 
             profileImageUrl: 'lib/static/trident.jpg',
             bio: 'Lorem ipsum dolor sit amet.'),
             Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: const [
                Text(
                   "Recently Played",
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
             PlayerCard(
             userName: 'Noa360', 
             profileImageUrl: 'lib/static/profile.jpg',
             bio: 'Lorem ipsum dolor sit amet'),
             PlayerCard(
             userName: 'Hurrikane', 
             profileImageUrl: 'lib/static/hurrikane.jpg',
             bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
             PlayerCard(
             userName: 'Catalyst', 
             profileImageUrl: 'lib/static/catalyst.jpg',
             bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elitaor magna aliqua.'),
             PlayerCard(
             userName: 'Mazzy', 
             profileImageUrl: 'lib/static/mazzy.jpg',
             bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'),
             PlayerCard(
             userName: 'Logosh', 
             profileImageUrl: 'lib/static/logosh.jpg',
             bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
         ],
       ),
     )
   );
  }
}