// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/widgets/player_card_detailed.dart';

class SearchResult extends StatelessWidget {

  SearchResult({required this.data});

  Map <String, dynamic> data; 

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
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10 ,5),
                  child: Text(
                     "Result",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0 ,10),
                  child: Row(
                    children: [
                      Container(
                            height: 3.0,
                            width: 50.0,
                            color: ConstantColors.secondaryColor,
                        ),
                    ],
               ),
                ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data['data'].length,
                    itemBuilder: (context, index) {
                      return PlayerCardDetailed(
                        name: data['data'][index]['username'] + ' (${data['data'][index]['discord']})',
                        nationality: data['data'][index]['nationality'], 
                        mostlyplayed: data['data'][index]['mostlyPlayed'], 
                        language: data['data'][index]['languages'][0],
                        description: data['data'][index]['description'],
                        experience: data['data'][index]['experience'].toString(),
                        url: data['data'][index]['profilePicture'] == 'none' ? 'https://res.cloudinary.com/df8qz9hlx/image/upload/v1651752696/wasd/default_rcmogi.jpg' : data['data'][index]['profilePicture'],
                    );
                  }),
              ],),
          ),
          ),
    );
  }
}

