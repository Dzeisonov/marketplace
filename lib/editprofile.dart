import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Edit Profile"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _buildProfileIcon("lib/images/profile.png"),
              ),
              SizedBox(height: 20),
              _buildEditProfileItem("Full Name"),
              _buildEditProfileItem("Username"),
              _buildEditProfileItem("Email"),
              _buildEditProfileItem("Phone Number"),
              _buildEditProfileItem("Address"),
              _buildEditProfileItem("Bio"),
              SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditProfileItem(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            labelText: label, // Label di atas input
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProfileIcon(String path) {
  return Container(
    margin: EdgeInsets.all(10.0), 
    padding: EdgeInsets.all(4.0),  
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Color.fromARGB(255, 226, 222, 222), 
        width: 4.0, 
      ),
    ),
    child: CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage(path),
    ),
  );
}

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Implement logic to save changes here
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        ),
        child: Text(
          "Save Changes",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
