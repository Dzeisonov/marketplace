import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade200,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Catalog Page'),
            )));
  }
}
