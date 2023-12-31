import 'package:flutter/material.dart';
import 'package:marketplace/sizeconfig.dart';
import 'package:marketplace/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.text,
    this.press,
  });
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(135),
      height: getProportionateScreenHeight(40),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}