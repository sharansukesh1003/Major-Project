import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/widgets/news_tile.dart';

class NewsView extends StatelessWidget {
  const NewsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
          Text("N",
            style: TextStyle(
              color: ConstantColors.secondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
            Text("ews",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              NewsTile(imageUrl: 'lib/static/news1.jpg', title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'),
              NewsTile(imageUrl: 'lib/static/news2.jpg', title: 'Lorem ipsum dolor sit amet, consectetur adipiscing.', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              NewsTile(imageUrl: 'lib/static/news3.png', title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.'),
              NewsTile(imageUrl: 'lib/static/news4.webp', title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, consequat.', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.')
            ]
          ),
        ),
      ),
    );
  }
}