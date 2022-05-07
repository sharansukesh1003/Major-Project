// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';

class PlayerCardDetailed extends StatelessWidget {

  final String name;
  final String nationality;
  final String mostlyplayed;
  final String language;
  final String description;
  final String experience;
  final String url;

  const PlayerCardDetailed(
    {required this.name, 
    required this.nationality, 
    required this.mostlyplayed, 
    required this.language,
    required this.description,
    required this.experience,
    required this.url
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstantColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          visualDensity: const VisualDensity(vertical: 4),
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      description,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(nationality,
                         style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white30,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(height: 20, color: ConstantColors.secondaryColor, width: 2,),
                      ),
                      Text(mostlyplayed,
                         style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white30,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(height: 20, color: ConstantColors.secondaryColor, width: 2,),
                      ),
                      Text(language,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white30,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(height: 20, color: ConstantColors.secondaryColor, width: 2,),
                      ),
                      Text(experience,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white30,
                          ),
                      ),
                    ],
                  )
            ],
          ),
          leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: ClipOval(
          child: Image.network(url, fit: BoxFit.cover)
            ),
          ),
        ),
      ), 
    );
  }
}