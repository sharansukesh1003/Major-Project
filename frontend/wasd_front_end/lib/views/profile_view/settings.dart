import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';
import 'package:wasd_front_end/views/authentication_view/login.dart';
import 'package:wasd_front_end/views/profile_view/profile_photo.dart';
import 'package:wasd_front_end/views/profile_view/profile_settings.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({ Key? key }) : super(key: key);

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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                            context,
                            PageTransition(
                                child: const ProfilePicture(),
                                type: PageTransitionType.rightToLeft),
                          );
                },
                child: const Text("Edit Profile Picture",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 3.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                  height: 10,
                ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                            context,
                            PageTransition(
                                child: ProfileSettingsView(),
                                type: PageTransitionType.rightToLeft),
                          );
                },
                child: const Text("Edit Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              Container(
                    height: 3.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                height: 10,
              ),
              const Text("Help",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    )
                  ),
                const SizedBox(
                  height: 10,
                ),
              Container(
                    height: 3.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                height: 10,
              ),
              const Text("About",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    )
                  ),
                const SizedBox(
                  height: 10,
                ),
              Container(
                    height: 3.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  CacheService cacheService = CacheService();
                  await cacheService.deleteCache(key: "jwt");
                  await cacheService.deleteCache(key: "id");
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginView()),
                      (route) => false);
                },
                child: Row(
                  children: const [
                    Text("Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                        )
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                        Icons.logout_outlined,
                        color:ConstantColors.secondaryColor,
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}