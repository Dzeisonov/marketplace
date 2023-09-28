import 'package:flutter/material.dart';
import 'package:marketplace/data.dart';
import '../../login/login.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SplashContent(
                image: "lib/images/splash.png",
                text: "Welcome to Manière, Let's shop!"
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  DefaultButton
                  (
                    text: "Continue",
                    press: () {
                      ShopItem.fetchData("Shoes");
                      ShopItem.fetchData("Accessories");
                      ShopItem.fetchData("Clothes");
                      ShopItem.fetchData("Hats");
                      ShopItem.fetchData("Trends");
                      ShopItem.fetchData("BestSeller");
                      Navigator.pushNamed(context, LogInScreen.routeName);
                    },
                  ),
                  Spacer(),
                ]
              )
            ),
          ]
        ),
      ),
    );
  }
}

