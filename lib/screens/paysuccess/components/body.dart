import 'package:flutter/material.dart';
import 'package:marketplace/components/default_button_black.dart';
import 'package:marketplace/sizeconfig.dart';
import '../../../navbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/icons/verified-animated-3.gif",
            height: SizeConfig.screenHeight * 0.30,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          Text("Payment Successful",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          Text("Your payment has been processed!",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              )),
          SizedBox(
            height: SizeConfig.screenHeight * 0.05,
          ),
          DefaultButtonBlack(
            width: 145,
            text: "Purchase more!",
            press: () {
              Navigator.pushNamed(context, NavBar.routeName);
            },
          ),
        ],
      ),
    );
  }
}
