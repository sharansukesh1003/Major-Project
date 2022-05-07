// ignore_for_file: unused_local_variable, unused_import, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/model/authentication_message.dart';
import 'package:wasd_front_end/core/notifier/authentication_notifier.dart';
import 'package:wasd_front_end/core/services/authenthication_service.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';

// ignore: use_key_in_widget_constructors
class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    CacheService cacheService = CacheService();
    return Scaffold(
      backgroundColor: ConstantColors.primaryColor,
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const Image(
                      image: AssetImage('lib/static/intro_screen_2.jfif'), 
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      ),
                    Container(
                      width: double.infinity,
                      color: Colors.black45,
                    ),
                    const Center(child: Image(image: AssetImage('lib/static/logo.png',),height: 150,width: 150,),)
                  ],
                ),
              ),
              Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    controller: emailController,
                    cursorHeight: 15.0,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
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
                  const SizedBox(height: 10),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
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
                  const SizedBox(height: 10),
                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    color: ConstantColors.secondaryColor,
                    child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () async {
                      var data = await Authentication.login(emailController.text, passwordController.text);
                      if (data.authentication) {
                        await cacheService.writeCache(key: "jwt", value: data.token);
                        await cacheService.writeCache(key: "id", value: data.id);
                        Navigator.of(context).popAndPushNamed(MainRoute);
                      }
                      else { 
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(data.message),)
                        );
                      }
                    }),
                  const SizedBox(height: 10),
                   Row(
                     mainAxisAlignment : MainAxisAlignment.center,
                     children: <Widget> [
                       const Text('Do not have an account?',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 16.0
                          ),
                         ),
                       TextButton(onPressed: (){
                         Navigator.of(context).pushNamed(SignUpRoute);
                       }, child: const Text('Sign Up',
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
              ),)
            ],
          ),
        ),
      )
    );
  }
}
