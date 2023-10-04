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
        ),
      ),
    );
  }

  Widget _buildSettingsScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          _buildSettingsItem("Language", Icons.language),
          _buildSettingsItem("Display", Icons.settings_display),
          _buildSettingsItem("Notifications", Icons.notifications),
          _buildSettingsItem("Security", Icons.security),
          _buildSettingsItem("FAQ", Icons.question_answer),
          _buildSettingsItem("Terms & Conditions", Icons.assignment_outlined),
          _buildSettingsItem("Privacy Policy", Icons.privacy_tip_outlined),
          _buildSettingsItem("About Us", Icons.info),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          ListTileTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(title, style: TextStyle(fontSize: 18)),
              ),
              trailing: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                _showToast("Under Development");
              },
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
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
