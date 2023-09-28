import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


typedef void ProfileUpdateCallback(String username, String email, int phoneNumber);

typedef void AvatarUpdateCallback(String newAvatarPath);


class EditProfileScreen extends StatefulWidget {
  final ProfileUpdateCallback? onProfileUpdate;
  final AvatarUpdateCallback? onAvatarUpdate;

  EditProfileScreen({Key? key, this.onProfileUpdate, this.onAvatarUpdate}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String selectedAvatar = "lib/images/avatar1.jpg";

  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bioController = TextEditingController();

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

  void _saveData() async {
    String fullName = fullNameController.text;
    String username = usernameController.text;
    String email = emailController.text;
    String phoneNumberText = phoneNumberController.text;
    String address = addressController.text;
    String bio = bioController.text;

    int phoneNumber;

    try {
      phoneNumber = int.parse(phoneNumberText);
    } catch (e) {
      phoneNumber = 0;
  }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullName);
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setInt('phoneNumber', phoneNumber);
    await prefs.setString('address', address);
    await prefs.setString('bio', bio);
    await prefs.setString('avatar', selectedAvatar);

    _showToast("Data saved successfully");

    if (widget.onProfileUpdate != null) {
      widget.onProfileUpdate?.call(username, email, phoneNumber);
    }

    if (widget.onAvatarUpdate != null) {
      widget.onAvatarUpdate?.call(selectedAvatar);
    }

  }

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullNameController.text = prefs.getString('fullName') ?? "";
      usernameController.text = prefs.getString('username') ?? "";
      emailController.text = prefs.getString('email') ?? "";
      int phoneNumber = prefs.getInt('phoneNumber') ?? 0;
      phoneNumberController.text = phoneNumber.toString();
      addressController.text = prefs.getString('address') ?? "";
      bioController.text = prefs.getString('bio') ?? "";
      selectedAvatar = prefs.getString('avatar') ?? selectedAvatar; 
    });
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
              _buildEditProfileItem("Full Name", "Enter your full name...", controller: fullNameController),
              _buildEditProfileItem("Username", "Enter your username...", controller: usernameController),
              _buildEditProfileItem("Email", "Enter your email...", controller: emailController),
              _buildEditProfileItem("Phone Number", "Enter your phone number...", controller: phoneNumberController),
              _buildEditProfileItem("Address", "Enter your address...", controller: addressController),
              _buildEditProfileItem("Bio", "Enter your bio...", controller: bioController),
              SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditProfileItem(String label, String hint, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
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
                            color: isSelected ? Colors.green : Colors.transparent,
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
        onPressed: _saveData,
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