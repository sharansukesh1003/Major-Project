import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wasd_front_end/constants/constants.dart';

class IntroductionPageList{
  static List<PageViewModel> getPages(){
    return [
      PageViewModel(
      titleWidget: RichText(
        text: const TextSpan(
          text: 'Like Playing ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 34.0,
          ),
          children: <TextSpan>[
            TextSpan(text: 'Games', style: TextStyle(
              color: ConstantColors.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 38.0,
          )),
            TextSpan(text: '?',
             style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 34.0,
              )
            ),
          ],
        ),
      ),
      bodyWidget: const Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
        style: TextStyle(
          color: ConstantColors.smallTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.0
          ),
        ),
          image: Center(
            child: Image.asset('lib/static/intro_screen_1.jfif', 
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
      ), 
    ),
      PageViewModel(
      titleWidget: RichText(
        text: const TextSpan(
          text: 'Connect with ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 34.0,
          ),
          children: <TextSpan>[
            TextSpan(text: 'Others', style: TextStyle(
              color: ConstantColors.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 38.0,
          )),
            TextSpan(text: '?',
             style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 34.0,
              )
            ),
          ],
        ),
      ),
      bodyWidget: const Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
        style: TextStyle(
          color: ConstantColors.smallTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.0
          ),
        ),
          image: Center(
            child: Image.asset('lib/static/intro_screen_2.jfif', 
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
      ), 
    )
    ];
  }
}