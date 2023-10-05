import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLanguage = "English";
  bool isDarkModeEnabled = false;

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
          _buildSettingsItem("Language", Icons.language, _showLanguageDialog),
          _buildSettingsItem(
              "Display", Icons.settings_display, _showDisplayDialog),
          _buildSettingsItem(
              "Notifications", Icons.notifications, _showNotificationsDialog),
          _buildSettingsItem("Security", Icons.security, _showSecuritySettings),
          _buildSettingsItem("FAQ", Icons.question_answer, _showFAQDialog),
          _buildSettingsItem("Terms & Conditions", Icons.assignment_outlined,
              _showTermsConditions),
          _buildSettingsItem(
              "Privacy Policy", Icons.privacy_tip_outlined, _showPrivacyPolicy),
          _buildSettingsItem("About Us", Icons.info, _showAboutUs),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          ListTileTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              leading: Icon(icon),
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(title, style: TextStyle(fontSize: 18)),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: onTap,
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

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("English (Default)"),
                onTap: () {
                  Navigator.of(context).pop();
                  _showToast("Language is already set to English");
                },
              ),
              ListTile(
                title: Text("Bahasa Indonesia"),
                onTap: () {
                  setState(() {
                    selectedLanguage = "Bahasa Indonesia";
                  });
                  Navigator.of(context).pop();
                  _showToast("Language changed to Bahasa Indonesia");
                },
              ),
              ListTile(
                title: Text("普通话"),
                onTap: () {
                  setState(() {
                    selectedLanguage = "普通话";
                  });
                  Navigator.of(context).pop();
                  _showToast("Language changed to 普通话");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDisplayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Display Mode"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.light_mode,
                      color: isDarkModeEnabled ? Colors.grey : Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Light Mode",
                      style: TextStyle(
                        color: isDarkModeEnabled ? Colors.grey : Colors.black,
                        fontWeight: isDarkModeEnabled
                            ? FontWeight.normal
                            : FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "(Default)",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    isDarkModeEnabled = false;
                  });
                  Navigator.of(context).pop();
                  _showToast("Light Mode selected");
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.dark_mode,
                      color: isDarkModeEnabled ? Colors.blue : Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Dark Mode",
                      style: TextStyle(
                        color: isDarkModeEnabled ? Colors.black : Colors.grey,
                        fontWeight: isDarkModeEnabled
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    isDarkModeEnabled = true;
                  });
                  Navigator.of(context).pop();
                  _showToast("Dark Mode selected");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotificationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notifications"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.local_shipping),
                title: Text("Your order is on its way."),
                subtitle: Text("Please complete your payment."),
                trailing: Text("Oct 4, 2023"),
              ),
              ListTile(
                leading: Icon(Icons.local_shipping),
                title: Text("Your order is on its way."),
                subtitle: Text("Please complete your payment."),
                trailing: Text("Sept 27, 2023"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSecuritySettings() {
    _showToast("Security Settings");
  }

  void _showFAQDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("FAQ"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFAQItem("Q: How long will my package take to arrive?",
                  "A: Your package will arrive within a maximum of 3 days after payment."),
              _buildFAQItem("Q: Can I return items if they don't fit?",
                  "A: Yes, you can return items within 7 days of delivery if they don't fit."),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(answer),
        SizedBox(height: 10),
      ],
    );
  }

  void _showTermsConditions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Terms & Conditions"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1. Introduction",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Welcome to Manière, your one-stop destination for the latest in fashion trends and styles. These Terms and Conditions govern your use of the Maniere fashion shopping app. By using the app, you agree to comply with and be bound by these Terms and Conditions. If you do not agree with any part of these terms, please do not use the app.",
                ),
                SizedBox(height: 8),
                Text(
                  "2. User Registration",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "2.1. To use certain features of the app, you may be required to register for an account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.",
                ),
                SizedBox(height: 8),
                Text(
                  "2.2. You must provide accurate and complete information during the registration process. If any information provided by you is found to be inaccurate or incomplete, we reserve the right to terminate your account.",
                ),
                SizedBox(height: 8),
                Text(
                  "3. Privacy",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "3.1. Your use of the app is also governed by our Privacy Policy, which can be found here. By using the app, you consent to the collection, use, and sharing of your information as described in the Privacy Policy.",
                ),
                SizedBox(height: 8),
                Text(
                  "4. Orders and Payments",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "4.1. When you place an order through the Maniere app, you are making a purchase. You agree to pay for all products ordered, including any applicable taxes and shipping fees.",
                ),
                SizedBox(height: 8),
                Text(
                  "4.2. Payment methods accepted by Maniere include credit cards, debit cards, and other payment options as specified in the app.",
                ),
                SizedBox(height: 8),
                Text(
                  "5. Shipping and Returns",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "5.1. Maniere aims to deliver your orders in a timely manner. Estimated delivery times will be provided during the checkout process.",
                ),
                SizedBox(height: 8),
                Text(
                  "5.2. If you are not satisfied with your purchase, you may return it within 7 days of delivery for a refund or exchange, subject to our return policy. Please refer to our Return Policy for more details.",
                ),
                SizedBox(height: 8),
                Text(
                  "6. Intellectual Property",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "6.1. The content, images, logos, and trademarks displayed on the Maniere app are the property of Maniere or its affiliates. You may not use, reproduce, or distribute any of these materials without our express written permission.",
                ),
                SizedBox(height: 8),
                Text(
                  "7. User Conduct",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "7.1. You agree to use the app only for lawful purposes and in compliance with these Terms and Conditions. You may not engage in any activity that could harm the app or interfere with its proper functioning.",
                ),
                SizedBox(height: 8),
                Text(
                  "8. Termination",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "8.1. Maniere reserves the right to terminate or suspend your access to the app at any time and for any reason, including violations of these Terms and Conditions.",
                ),
                SizedBox(height: 8),
                Text(
                  "9. Changes to Terms and Conditions",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "9.1. Maniere may update these Terms and Conditions from time to time. You are encouraged to review them periodically. Your continued use of the app after changes are made constitutes your acceptance of the revised Terms and Conditions.",
                ),
                SizedBox(height: 8),
                Text(
                  "10. Contact Information",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "10.1. If you have any questions or concerns regarding these Terms and Conditions, please contact us at maniere@stu.untar.ac.id.",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPrivacyPolicy() {
    _showToast("Privacy Policy");
  }

  void _showAboutUs() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "About Us",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This application project was created by group 4 with the marketplace subtheme",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("1. 535220001 Marchella Angelina"),
              Text("2. 535220002 Jason Permana"),
              Text("3. 535220004 Arya Wira Kristanto"),
              Text("4. 535220013 Jafier Andreas"),
              Text("5. 535220027 Nicholas Martin"),
              Text("6. 535220038 Kevin Jonathan JM"),
            ],
          ),
        );
      },
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

void main() {
  runApp(MaterialApp(
    home: SettingsScreen(),
  ));
}
