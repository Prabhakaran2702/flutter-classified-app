import 'package:flutter/material.dart';
import 'package:flutter_classifiedappclone/ui/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_classifiedappclone/ui/screens/sign_up/sign_up_screen.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text("Complete Profile", style: headingStyle),
          SizedBox(height: 20),
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              );

            },
          ),
        ],
      ),
    );
  }
}
