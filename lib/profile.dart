import 'package:flutter/material.dart';

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
        body: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                _buildProfileIcon("lib/images/profile.png"),
                SizedBox(height: 20),
                _buildMenuItem("Edit Profile", 20, () {
                  // Customize this part to navigate to your ProfileScreen.
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ProfileScreen(); // Replace with your ProfileScreen widget.
                  }));
                }),
                _buildDivider(10, 10),
                _buildMenuItem("Payments", 20, () {
                  // Customize this part to navigate to your ProfileScreen.
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PaymentsScreen(); // Replace with your ProfileScreen widget.
                  }));
                }),
                _buildDivider(10, 10),
                _buildMenuItem("Settings", 20, () {
                  // Customize this part to navigate to your ProfileScreen.
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SettingsScreen(); // Replace with your ProfileScreen widget.
                  }));
                }),
              ],
            )));
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

  Widget _buildMenuItem(String text, double fontSize, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Specify the callback to be called when tapped.
      child: Container(
        color: Colors.white, // Background color
        padding: EdgeInsets.all(8.0), // Adjust padding as needed
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize, // Text size
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
              alignment: Alignment.center,
              child: Text('Profile Screens'),
            )));
  }
}

class PaymentsScreen extends StatefulWidget {
  PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Payments"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.center,
              child: Text('Payments Screen'),
            )));
  }
}

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Settings"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.center,
              child: Text('Settings Screen'),
            )));
  }
}
