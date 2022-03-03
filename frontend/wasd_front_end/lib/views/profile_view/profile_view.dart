import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:wasd_front_end/constants/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: const Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85),
        actions: <Widget> [
          IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 53,
                  backgroundColor: ConstantColors.secondaryColor,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('lib/static/profile.jpg')
                        ),
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
                        children: const [
                          Text("Dante",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(
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
                  Column(
                  children: const [
                    Text("15",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                    Text("Games \nPlayed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18
                    ),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Text("3",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                    Text("Recommended \nGames",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18
                    ),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Text("CS:GO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                    Text("Most \nPlayed",
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
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: double.infinity,
                      child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/static/profile.jpg')
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: double.infinity,
                      child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/static/profile.jpg')
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: double.infinity,
                      child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/static/profile.jpg')
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: double.infinity,
                      child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/static/profile.jpg')
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: double.infinity,
                      child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/static/profile.jpg')
                          ),
                    ),
                  ),
                ],
                ),
            )
        ],
      ),
    );
  }
}