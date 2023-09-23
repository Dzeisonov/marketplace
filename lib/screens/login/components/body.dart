import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace/sizeconfig.dart';

import 'login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: 
            EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)
          ),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(40)),
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                "Log in with your email and password\n or continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              LogInForm(),
              SizedBox(height: getProportionateScreenHeight(25)),
              Text(
                "or using",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("lib/icons/fb.svg"),
              ),
            ],
          ),
        ),
      )
    );
  }
}




// class Body extends StatelessWidget {
//   final VoidCallback onLoggedIn;

//   Body({required this.onLoggedIn});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.black,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(
//               height: 175,
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Login",
//                     style: TextStyle(color: Colors.white, fontSize: 40),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Welcome Back",
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(60),
//                         topRight: Radius.circular(60))),
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: EdgeInsets.all(30),
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 60,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(color: Colors.black26),
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 10,
//                                     offset: Offset(0, 4))
//                               ]),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey.shade200))),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                       hintText: "Email or Phone number",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       border: InputBorder.none),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                       hintText: "Password",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       border: InputBorder.none),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Text(
//                           "Forgot Password?",
//                           style: TextStyle(color: Colors.black54),
//                         ),
//                         SizedBox(
//                           height: 40,
//                         ),

// //////////////////////////////////////////////////////////////////////////////////////////
//                         //Dari Container jadi Row supaya buttonnya bisa sesuai size
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 height: 50,
//                                 margin: EdgeInsets.symmetric(horizontal: 50),
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50),
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     onLoggedIn();
//                                   },
//                                   child: Text(
//                                     "Login",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
// //////////////////////////////////////////////////////////////////////////////////////////

//                         SizedBox(
//                           height: 50,
//                         ),
//                         Text(
//                           "Continue with social media",
//                           style: TextStyle(color: Colors.black54),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Expanded(
//                               child: Container(
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     color: Colors.blue),
//                                 child: Center(
//                                   child: Text(
//                                     "Facebook",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 30,
//                             ),
//                             Expanded(
//                               child: Container(
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     color: Colors.black),
//                                 child: Center(
//                                   child: Text(
//                                     "Github",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }