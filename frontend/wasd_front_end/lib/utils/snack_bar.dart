import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarUtility{
  static showSnackBar({required BuildContext context, required String message}){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}