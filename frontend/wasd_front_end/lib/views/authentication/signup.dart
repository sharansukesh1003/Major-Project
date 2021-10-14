import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/core/notifier/authenticationnotifier.dart';

// ignore: use_key_in_widget_constructors
class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var authenticationNotifier = Provider.of<AuthenticationNotifier>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text("SignUp"),
      ),
      backgroundColor: Colors.grey,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
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
                child: const Text("Sign Up"),
                onPressed: (){
                  authenticationNotifier.signUp(
                    context: context,
                    name: userNameController.text,
                    email: emailController.text,
                    password: passwordController.text);
                    // ignore: avoid_print
                    print("pressed");
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
    );
  }
}