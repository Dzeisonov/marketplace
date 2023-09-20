import 'package:flutter/material.dart';

class PaymentsScreen extends StatefulWidget {
  PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Payments"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: _buildPaymentsScreen(),
            )));
  }

  Widget _buildPaymentsScreen() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          _buildPaymentsItem("Debit/Credit Cards"),
          _buildDivider(10, 10),
          _buildPaymentsItem("Manière Credits"),
          _buildDivider(10, 10),
          _buildPaymentsItem("Vouchers"),
          _buildDivider(10, 10),
          _buildPaymentsItem("Gift Cards"),
          _buildDivider(10, 10),
        ]),
      ),
    );
  }

  Widget _buildPaymentsItem(String item) {
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
