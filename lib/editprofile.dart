import 'package:flutter/material.dart';

import 'constants.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Edit Profile"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: _buildEditProfileScreen(),
            )));
  }

  Widget _buildEditProfileScreen() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          _buildProfileIcon("lib/images/profile.png"),
          SizedBox(
            height: 10,
          ),
          _buildEditProfileItem("Profile Icon"),
          _buildDivider(10, 10),
          _buildEditProfileItem("Name"),
          _buildDivider(10, 10),
          _buildEditProfileItem("Phone Number"),
          _buildDivider(10, 10),
          _buildEditProfileItem("E-mail Address"),
          _buildDivider(10, 10),
          _buildEditProfileItem("Delivery Address"),
          _buildDivider(10, 10),
          _buildEditProfileItem("Open Shop"),
          _buildDivider(10, 10),
        ]),
      ),
    );
  }

  Widget _buildEditProfileItem(String item) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 12, top: 10, bottom: 10),
      child: Text(
        item,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildDivider(double indent, double endIndent) {
    return Divider(
      height: 1,
      thickness: 2,
      color: Colors.black,
      indent: indent, // Customize the space before the divider
      endIndent: endIndent, // Customize the space after the divider
    );
  }

  Widget _buildProfileIcon(String path) {
    return Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(path),
      ),
    );
  }
}
