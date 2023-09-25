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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('lib/images/profile.png'), 
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Manière",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "maniere@gmail.com",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "+62xxxxxxxxxxx",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Followers 0",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Following 0",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            ListTile(
              title: Text("Edit Profile", style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.edit),
              onTap: () {
                _navigateToProfileScreen();
              },
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            ListTile(
              title: Text("Payments", style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.payment),
              onTap: () {
                _navigateToPaymentsScreen();
              },
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            ListTile(
              title: Text("Settings", style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.settings),
              onTap: () {
                _navigateToSettingsScreen();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProfileScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ProfileScreen();
    }));
  }

  void _navigateToPaymentsScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return PaymentsScreen();
    }));
  }

  void _navigateToSettingsScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return SettingsScreen(); 
    }));
  }
}
