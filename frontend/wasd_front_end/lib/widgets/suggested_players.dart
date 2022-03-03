import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';

class PlayerCard extends StatelessWidget {

  PlayerCard({ required this.userName, required this.profileImageUrl, required this.bio });

  final String userName;
  final String profileImageUrl;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstantColors.backgroundColor,
      child: ListTile(
        visualDensity: const VisualDensity(vertical: 4),
        title: Text(
          userName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        subtitle: Text(
          bio,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white54
          ),
        ),
        leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: ClipOval(
        child: Image(
        fit: BoxFit.cover,
        image: AssetImage(profileImageUrl)
            ),
          ),
        ),
      ),
    );
  }
}