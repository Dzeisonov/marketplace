import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String selectedAvatar = "lib/images/avatar1.jpg"; // avatar1 dijadikan sebagai foto profil default

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  void _selectAvatar(String path) {
    setState(() {
      selectedAvatar = path;
    });
    Navigator.pop(context);
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
              SizedBox(height: 20), 
              Center(
                child: _buildProfileIcon(selectedAvatar),
              ),
              SizedBox(height: 20),
              _buildEditProfileItem("Full Name", "Enter your full name..."),
              _buildEditProfileItem("Username", "Enter your username..."),
              _buildEditProfileItem("Email", "Enter your email..."),
              _buildEditProfileItem("Phone Number", "Enter your phone number..."),
              _buildEditProfileItem("Address", "Enter your address..."),
              _buildEditProfileItem("Bio", "Enter your bio..."),
              SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditProfileItem(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
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
              title: Text("Choose an Avatar"),
              content: Container(
                width: double.maxFinite,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 6, 
                  itemBuilder: (context, index) {
                    final avatarPath = "lib/images/avatar${index + 1}.jpg";
                    final isSelected = avatarPath == selectedAvatar;

                    return GestureDetector(
                      onTap: () {
                        _selectAvatar(avatarPath);
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected ? Colors.green : Colors.transparent, // Menampilkan border hijau jika dipilih
                            width: 4.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(avatarPath),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 40,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color.fromARGB(255, 196, 196, 196),
            width: 4.0,
          ),
        ),
        child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(path),
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
