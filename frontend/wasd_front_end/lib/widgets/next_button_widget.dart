// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 30,
          width: 30,
          decoration:const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
            ),
            child: const Icon(
              Icons.navigate_next,
              size: 30,
              color: ConstantColors.secondaryColor,
        ),
    );
  }
}