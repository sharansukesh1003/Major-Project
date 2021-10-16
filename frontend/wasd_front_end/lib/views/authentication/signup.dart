// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/notifier/authenticationnotifier.dart';
import 'package:wasd_front_end/core/notifier/utility_notifier.dart';

// ignore: use_key_in_widget_constructors
class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var authenticationNotifier = Provider.of<AuthenticationNotifier>(context,listen: false);
    var utilityNotifier = Provider.of<UtilityNotifier>(context, listen: false);
    var _userimage = Provider.of<UtilityNotifier>(context, listen: true).userimage;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        print(utilityNotifier.userimage);
      },),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text("SignUp"),
      ),
      backgroundColor: Colors.grey,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: userNameController,
                  decoration:const InputDecoration(
                    hintText: "Enter Username"
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration:const InputDecoration(
                    hintText: "Enter E-mail"
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Enter Password"
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  color: Colors.green,
                  child: Text(
                    utilityNotifier.userimage!.isEmpty ? 
                    "Upload Image" : 
                    "Reselect"),
                  onPressed: (){
                    utilityNotifier.uploadUserImage(context: context);
                  }),
                const SizedBox(height: 10),
                _userimage!.isNotEmpty ? Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ConstantColors.backgroundColor,
                    ),
                  child: Image.network(utilityNotifier.userimage!),
                ) : Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ConstantColors.backgroundColor
                    ),
                    child: Image.network("https://pngtree.com/so/purple"),
                ),
                MaterialButton(
                  child: const Text("Sign Up"),
                  onPressed: (){
                    authenticationNotifier.signUp(
                      context: context,
                      username: userNameController.text,
                      useremail: emailController.text,
                      userpassword: passwordController.text,
                      userimage: utilityNotifier.userimage!
                      );
                  }),
                  const SizedBox(height: 10),
                  MaterialButton(
                  color: Colors.red,
                  child: const Text("Login"),
                  onPressed: (){
                    Navigator.of(context).pushNamed(LoginRoute);
                  }
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}