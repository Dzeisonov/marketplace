import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentsScreen extends StatefulWidget {
  PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  String selectedPayment = '';
  String cardNumber = '';
  String expiresDate = '';
  String cvv = '';

  String maniereCreditsData = '';
  String giftCardsData = '';

  int maniereCreditsPoints = 1000;

  List<Map<String, dynamic>> vouchers = [
    {
      'name': 'Free Shipping',
      'description': 'Get free shipping on your next order',
      'expiryDate': DateTime(2023, 12, 31),
      'used': false,
    },
    {
      'name': '50% Discount',
      'description': 'Enjoy a 50% discount on your purchase',
      'expiryDate': DateTime(2023, 10, 15),
      'used': false,
    },
  ];

  String giftCode = '';  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Payments"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildPaymentsScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cardNumber = prefs.getString('cardNumber') ?? '';
      expiresDate = prefs.getString('expiresDate') ?? '';
      cvv = prefs.getString('cvv') ?? '';
    });
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cardNumber', cardNumber);
    prefs.setString('expiresDate', expiresDate);
    prefs.setString('cvv', cvv);
  }

  Widget _buildPaymentsScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPaymentsItem("Debit/Credit Cards", Icons.credit_card),
          if (selectedPayment == "Debit/Credit Cards") ...[
            SizedBox(height: 16.0),
            _buildCreditCardImage(),
            SizedBox(height: 16.0),
            _buildCreditCardForm(),
            SizedBox(height: 16.0),
            _buildSaveButton(),
          ],
          _buildDivider(),
          _buildPaymentsItem("Manière Credits", Icons.monetization_on, showPoints: true),
          if (selectedPayment == "Manière Credits") ...[
            SizedBox(height: 16.0),
            _buildManiereCreditsInfo(),
            SizedBox(height: 16.0),
            _buildSaveManiereCreditsButton(),
          ],
          _buildDivider(),
          _buildPaymentsItem("Vouchers", Icons.confirmation_num),
          if (selectedPayment == "Vouchers") ...[
            SizedBox(height: 16.0),
            _buildVouchersForm(),
            SizedBox(height: 16.0),
            _buildSaveVouchersButton(),
          ],
          _buildDivider(),
          _buildPaymentsItem("Gift Cards", Icons.card_giftcard),
          if (selectedPayment == "Gift Cards") ...[
            SizedBox(height: 16.0),
            _buildGiftCardsInstructions(),
            SizedBox(height: 16.0),
            _buildGiftCardImage(),
            SizedBox(height: 16.0),
            _buildGiftCardCodeInput(),
            SizedBox(height: 16.0),
            _buildRedeemGiftCardButton(),
          ],
          _buildDivider(),
        ],
      ),
    );
  }

  Widget _buildPaymentsItem(String item, IconData iconData, {bool showPoints = false}) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: Icon(
          iconData,
          size: 36.0,
          color: Colors.blue,
        ),
        title: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: showPoints ? Text("Points: $maniereCreditsPoints") : null,
        onTap: () {
          setState(() {
            selectedPayment = item;
          });
        },
      ),
    );
  }

  Widget _buildCreditCardImage() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'lib/images/credit-debit-card.png',
        height: 200.0,
      ),
    );
  }

  Widget _buildCreditCardForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: (value) {
            cardNumber = value;
          },
          decoration: InputDecoration(
            labelText: "Card Number",
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  expiresDate = value;
                },
                decoration: InputDecoration(
                  labelText: "Expires Date",
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  cvv = value;
                },
                decoration: InputDecoration(
                  labelText: "CVV",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        _saveData();
        Fluttertoast.showToast(
          msg: "Your card data has been successfully saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      child: Text("Save"),
    );
  }

  Widget _buildDivider() {
    return SizedBox(height: 16.0);
  }

  Widget _buildManiereCreditsInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "You have $maniereCreditsPoints points",
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 16.0),
        Icon(
          Icons.monetization_on,
          size: 100.0,
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildSaveManiereCreditsButton() {
    return Container();
  }

  Widget _buildVouchersForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: vouchers.map((voucher) {
        bool isExpired = voucher['expiryDate'].isBefore(DateTime.now());
        return Card(
          elevation: 4.0,
          color: isExpired ? Colors.grey : Colors.white,
          child: ListTile(
            title: Text(
              voucher['name'],
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucher['description'],
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  'Expires on: ${voucher['expiryDate'].toString().split(' ')[0]}',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  'Status: ${voucher['used'] ? 'Used' : 'Not Used'}',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            onTap: () {
              if (!isExpired && !voucher['used']) {
                setState(() {
                  voucher['used'] = true;
                });
                Fluttertoast.showToast(
                  msg: "Voucher '${voucher['name']}' has been used",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSaveVouchersButton() {
    return ElevatedButton(
      onPressed: () {
        Fluttertoast.showToast(
          msg: "Voucher data has been successfully saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      child: Text("Save Vouchers"),
    );
  }

  Widget _buildGiftCardsInstructions() {
    return Text(
      "Enter your gift card code below:",
      style: TextStyle(fontSize: 18.0),
    );
  }

  Widget _buildGiftCardImage() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'lib/images/gift-card.png',
        height: 200.0,
      ),
    );
  }

  Widget _buildGiftCardCodeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: (value) {
            giftCode = value;
          },
          decoration: InputDecoration(
            labelText: "Gift Card Code",
          ),
        ),
      ],
    );
  }

  Widget _buildRedeemGiftCardButton() {
    return ElevatedButton(
      onPressed: () {
        Fluttertoast.showToast(
          msg: "Gift Card has been redeemed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      child: Text("Redeem Now"),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentsScreen(),
  ));
}
