// ignore_for_file: avoid_print, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/services/authenthication_service.dart';

// ignore: use_key_in_widget_constructors
class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: ConstantColors.primaryColor,
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: <Widget> [
            Expanded(
                child: Stack(
                  children: [
                    const Image(
                      image: AssetImage('lib/static/intro_screen_1.jfif'), 
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      ),
                    Container(
                      width: double.infinity,
                      color: Colors.black45,
                    ),
                    const Center(child: Image(image: AssetImage('lib/static/logo.png'),height: 150,width: 150,),)
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                child:  Column (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                        text: const TextSpan(
                          text: 'Join the largest Community of',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 34.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: ' Gamers', style: TextStyle(
                              color: ConstantColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 38.0,
                              )
                            ),
                          ],
                        ),
                  ),
                  TextField(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      controller: userNameController,
                      cursorHeight: 15.0,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                        hintStyle: TextStyle(
                          color: Colors.white54
                        ),
                        focusColor: Colors.white,
                        hintText: "Username",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )
                      ),
                    ),
                  TextField(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      controller: emailController,
                      cursorHeight: 15.0,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                        hintStyle: TextStyle(
                          color: Colors.white54
                        ),
                        focusColor: Colors.white,
                        hintText: "E-mail",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )
                      ),
                    ),
                  TextField(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                        hintStyle: TextStyle(
                          color: Colors.white54
                        ),
                        hintText: "Password",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                      ),
                    ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      color: ConstantColors.secondaryColor,
                      child: const Text("Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    onPressed: () async {
                      var data = await Authentication.signUp(emailController.text, userNameController.text, passwordController.text);
                      if (data.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(data.message),)
                        );
                        Navigator.of(context).pushNamed(LoginRoute);
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(data.message),)
                        );
                      }
                    }),
                    Row(
                       mainAxisAlignment : MainAxisAlignment.center,
                       children: <Widget> [
                         const Text('Already registered ?',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 16.0
                            ),
                           ),
                         TextButton(onPressed: (){
                           Navigator.of(context).pushNamed(LoginRoute);
                         }, child: const Text('Login',
                         style: TextStyle(
                           color: ConstantColors.secondaryColor,
                           fontSize: 18.0,
                           fontWeight: FontWeight.bold
                           ),
                          )
                         )
                       ],
                     ),
                      ],
                    ),
                  ),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
