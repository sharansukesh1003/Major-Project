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
            child: Image.network("https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80", 
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
            child: Image.network("https://images.unsplash.com/photo-1511512578047-dfb367046420?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1171&q=80", 
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
      ), 
    )
    ];
  }
}