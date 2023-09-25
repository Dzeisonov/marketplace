import 'package:flutter/material.dart';
import 'package:marketplace/editprofile.dart';
import 'package:marketplace/payments.dart';
import 'package:marketplace/settings.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              _buildProfileIcon("lib/images/profile.png"),
              SizedBox(height: 20),
              _buildMenuItem("Edit Profile", () {
                // Customize this part to navigate to your ProfileScreen.
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ProfileScreen(); // Replace with your ProfileScreen widget.
                }));
              }),
              _buildDivider(10, 10),
              _buildMenuItem("Payments", () {
                // Customize this part to navigate to your ProfileScreen.
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return PaymentsScreen(); // Replace with your ProfileScreen widget.
                }));
              }),
              _buildDivider(10, 10),
              _buildMenuItem("Settings", () {
                // Customize this part to navigate to your ProfileScreen.
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SettingsScreen(); // Replace with your ProfileScreen widget.
                }));
              }),
            ],
          ),
        ),
      ),
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

  Widget _buildMenuItem(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Specify the callback to be called when tapped.
      child: Container(
        color: Colors.white, // Background color
        padding: EdgeInsets.all(8.0), // Adjust padding as needed
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20, // Text size
            color: Colors.black, // Text color
          ),
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
}
