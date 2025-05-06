import 'package:flutter/material.dart';

class SearchFoods extends StatelessWidget {
  const SearchFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0)),
        prefixIcon: Icon(Icons.search),
        labelText: "O que você quer comer?",
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
