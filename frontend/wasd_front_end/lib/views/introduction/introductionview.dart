// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/widgets/indroduction_page_widget.dart';
import 'package:wasd_front_end/widgets/next_button_widget.dart';

class IntroductionView extends StatelessWidget {
  static ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        done: const Text('Get Started',
        style: TextStyle(
          color: ConstantColors.smallTextColor,
          fontWeight: FontWeight.bold
          ),
        ),
        onDone: (){
          Navigator.of(context).popAndPushNamed(LoginRoute);
        },
        pages: IntroductionPageList.getPages(),
        globalBackgroundColor: ConstantColors.primaryColor,
        showNextButton: true,
        dotsDecorator : const DotsDecorator(
          size : Size.square(10.0),
          activeSize : Size.square(15.0),
          activeColor : ConstantColors.secondaryColor,
        ),
        next: NextButton(),
      ),
    );
  }
}