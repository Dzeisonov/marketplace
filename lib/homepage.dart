import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade200,
        body: Container(
            child: Column(
          children: [SizedBox(height: 20), _buildSearchBar()],
        )));
  }
}

Widget _buildSearchBar() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(color: Colors.orange),
  );

  return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.topCenter,
      child: Column(children: [
        TextField(
            // onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          hintText: "Search",
          suffixIcon: const Icon(Icons.search),
          enabledBorder: outlineInputBorder, // Border in default state
          focusedBorder: outlineInputBorder,
        ))
      ]));
}
