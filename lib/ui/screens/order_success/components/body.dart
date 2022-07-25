import 'package:flutter/material.dart';

import '../../../../UI/screens/main_ui.dart';
import '../../../../UI/widgets/default_button.dart';
import '../../../../size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.06),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
         child: Text(
            "Order Successfully placed",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        SizedBox(height: 20),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 45),
          child: Text(
            'Thank you for the order Your order will be prepared and shipped by courier within 1-2 days',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              color: Colors.black45,
            ),
          ),
        ),

        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Continue shopping",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainUI(),
                ),
              );
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
