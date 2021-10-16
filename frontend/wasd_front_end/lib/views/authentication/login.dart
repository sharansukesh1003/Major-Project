import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/core/notifier/authenticationnotifier.dart';

// ignore: use_key_in_widget_constructors
class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var authenticationNotifier = Provider.of<AuthenticationNotifier>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Login"),
        // automaticallyImplyLeading: false,
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
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter E-mail"
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Enter E-mail"
                ),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                color: Colors.green,
                child: const Text("Login"),
                onPressed: (){
                  authenticationNotifier.login(email: emailController.text, password: passwordController.text,context: context);
                }),
              const SizedBox(height: 10),
               MaterialButton(
                color: Colors.green,
                child: const Text("Sign Up"),
                onPressed: (){
                  Navigator.of(context).pushNamed(SignUpRoute);
                }
                ), 
            ],
          ),
        ),
      ),
    );
  }
}