import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Edit Profile"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
            labelText: label, 
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProfileIcon(String path) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Profile Photo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Take a Photo"),
                  onTap: () {
                    Navigator.pop(context); 
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("Choose from Gallery"),
                  onTap: () {
                    Navigator.pop(context); 
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: Text("Cancel"),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 204, 204, 204),
          width: 4.0,
        ),
      ),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(path),
        child: Center(
          // Icon + untuk ubah foto profil (ambil foto baru atau pilih dari galeri)
          child: Icon(
            Icons.add,
            size: 60, 
            color: Colors.grey, 
          ),
        ),
      ),
    ),
  );
}

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _showToast("Data saved successfully");
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
