import 'package:flutter/material.dart';

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
        child: Column(children: [
          _buildSettingsItem("Language"),
          _buildDivider(10, 10),
          _buildSettingsItem("Display"),
          _buildDivider(10, 10),
          _buildSettingsItem("Notifications"),
          _buildDivider(10, 10),
          _buildSettingsItem("Security"),
          _buildDivider(10, 10),
          _buildSettingsItem("FAQ"),
          _buildDivider(10, 10),
          _buildSettingsItem("Terms & Conditions"),
          _buildDivider(10, 10),
          _buildSettingsItem("Privacy Policy"),
          _buildDivider(10, 10),
          _buildSettingsItem("About Us"),
          _buildDivider(10, 10),
        ]),
      ),
    );
  }

  Widget _buildSettingsItem(String item) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 12, top: 10, bottom: 10),
      child: Text(
        item,
        style: TextStyle(fontSize: 20),
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
