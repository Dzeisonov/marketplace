import 'package:flutter/material.dart';
import 'package:marketplace/components/default_button.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/sizeconfig.dart';

import '../../../components/form_error.dart';
import '../../../components/have_account.dart';
import '../../../components/social_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: 
          EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Container(
                  height: getProportionateScreenHeight(40.56),
                  width: getProportionateScreenWidth(49.92),
                  child: Image.asset(
                    "lib/images/splash.png",
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text(
                  "Register Account",
                  style: headingStyle,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  "Sign up with your email \nor continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextLightColor,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  
  late String email;
  late String name;
  String? password;
  String? confirm_password;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(18),
            ),
            child: buildEmailFormField(),
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(18),
            ),
            child: buildNameFormField(),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(56),
            ),
            child: FormError(errors: errors),
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          // SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState?.validate() ?? false) {

              };
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          Text(
            "or using",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextLightColor,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                icon: "lib/icons/facebook.png",
                press: () {},
              ),
              SocialCard(
                icon: "lib/icons/google.png",
                press: () {},
              ),
              SocialCard(
                icon: "lib/icons/instagram.png",
                press: () {},
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          haveAccount(),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
            keyboardType: TextInputType.name,
            onSaved: (newValue) => name = newValue!,
            style: TextStyle(
              color: kTextLightColor,
            ),
            decoration: InputDecoration(
              labelText: "Full Name",
              labelStyle: TextStyle(
                color: kTextLightColor,
              ),
              hintText: "Enter your full name",
              hintStyle: TextStyle(
                color: kTextLightColor,
                fontWeight: FontWeight.w100,
                fontSize: 14,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
        else if (value.isEmpty || emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      style: TextStyle(
        color: kTextLightColor,
      ),
      validator: (value) {
        if ((value == null || value.isEmpty) && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        }
        else if ((value != null && !value.isEmpty) && !emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
          color: kTextLightColor,
        ),
        hintText: "Enter your email",
        hintStyle: TextStyle(
          color: kTextLightColor,
          fontWeight: FontWeight.w100,
          fontSize: 14
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}