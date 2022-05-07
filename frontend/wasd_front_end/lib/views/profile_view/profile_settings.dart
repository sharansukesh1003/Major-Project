import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/services/profile_service.dart';

class ProfileSettingsView extends StatelessWidget {

  ProfileSettingsView({ Key? key }) : super(key: key);

  final recentlyPlayedController = TextEditingController();
  final gamesPlayedController = TextEditingController();
  final recommendedGamesController = TextEditingController();
  final mostlyPlayedController = TextEditingController();
  final reasonController = TextEditingController();
  final experienceController = TextEditingController();
  final nationalityController = TextEditingController();
  final regionController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.primaryColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: ageController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "age",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () async {
                              var response = await ProfileAPI.addAge(int.parse(ageController.text));
                              if (response['success']) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                  content: Text(response['message']),)
                                );
                                ageController.clear();
                              }
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                  content: Text(response['message']),)
                                );
                                ageController.clear();
                              }
                            }),
                    ],
                  ),
                  
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: genderController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "gender",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
                  
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: regionController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "region",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: nationalityController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "nationality",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: experienceController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "experience",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
                  
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: languageController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "language",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
                  
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: reasonController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "reason",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: gamesPlayedController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "games played",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
                  
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: recommendedGamesController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "recommended games",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
                  
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: recentlyPlayedController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "recently played",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
                  
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  children: [
                      Expanded(
                        child: TextField(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: mostlyPlayedController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                hintStyle: TextStyle(
                                  color: Colors.white54
                                ),
                                hintText: "mostly played",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: ConstantColors.secondaryColor,
                            child: const Text("add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            onPressed: () {
                             
                            }),
                    ],
                  ),
                  
            ),
          ],
        ),
      ),
    );
  }
}