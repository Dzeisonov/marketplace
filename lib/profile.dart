import 'package:flutter/material.dart';
import 'package:marketplace/editprofile.dart';
import 'package:marketplace/payments.dart';
import 'package:marketplace/screens/splash/splash_screen.dart';
import 'package:marketplace/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  String email = "";
  String phoneNumber = "1234567890";
  String selectedAvatar = "lib/images/avatar1.jpg";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? "";
      email = prefs.getString('email') ?? "";
      phoneNumber = prefs.getString('phoneNumber') ?? "";
      selectedAvatar = prefs.getString('avatar') ?? "lib/images/avatar1.jpg";
    });
  }

  void _updateProfile(
      String newUsername, String newEmail, String newPhoneNumber) {
    setState(() {
      username = newUsername;
      email = newEmail;
      phoneNumber = newPhoneNumber;
    });
  }

  void _updateAvatar(String newAvatarPath) {
    setState(() {
      selectedAvatar = newAvatarPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
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
                      //Ambil dari sharedPref
                      backgroundImage: AssetImage(selectedAvatar),
                    ),
                    SizedBox(height: 10),
                    Text(
                      //Ambil dari sharedPref
                      username,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      //Ambil dari sharedPref
                      email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      //Ambil dari sharedPref
                      phoneNumber.toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Following 34K",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "|",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Followers 85K",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Edit Profile", style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.edit),
                onTap: () {
                  _navigateToProfileScreen();
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Payments", style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.payment),
                onTap: () {
                  _navigateToPaymentsScreen();
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Settings", style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.settings),
                onTap: () {
                  _navigateToSettingsScreen();
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 24,
                ),
                onTap: () {
                  _logOut();
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToProfileScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return EditProfileScreen(
        onProfileUpdate: _updateProfile,
        onAvatarUpdate: _updateAvatar,
      );
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

  void _logOut() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return SplashScreen();
    }));
  }
}
