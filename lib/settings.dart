import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
              alignment: Alignment.topLeft,
              child: _buildSettingsScreen(),
            )));
  }

  Widget _buildSettingsScreen() {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                ListTile(
                  title: Text("Language", style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.language),
                  onTap: () {
                    _showToast("Under Development");
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Display", style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.settings_display),
                  onTap: () {
                    _showToast("Under Development");
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Notifications", style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.notifications),
                  onTap: () {
                    _showToast("Under Development");
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Security", style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.security),
                  onTap: () {
                    _showToast("Under Development");
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("FAQ", style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.question_answer),
                  onTap: () {
                    _showToast("Under Development");
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Terms & Conditions",
                      style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.assignment_outlined),
                  onTap: () {
                    _showToast("Under Development");
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Privacy Policy", style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.privacy_tip_outlined),
                  onTap: () {
                    _showToast("Under Development");
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("About Us", style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.info),
                  onTap: () {
                    _showToast("Under Development");
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}
