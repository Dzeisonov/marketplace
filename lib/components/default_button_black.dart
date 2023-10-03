import 'package:flutter/material.dart';
import 'package:marketplace/sizeconfig.dart';

class DefaultButtonBlack extends StatelessWidget {
  const DefaultButtonBlack({
    super.key,
    this.text,
    this.press,
    this.width,
  });
  final String? text;
  final Function? press;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width!),
      height: getProportionateScreenHeight(40),
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            primary: Colors.black,
            backgroundColor: Color(0xFF1E1E1E)),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(15),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
