import 'package:flutter/material.dart';

import '../constants.dart';

class Search extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          color: kTextFieldColor, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        onChanged: (value) {
          setState(() {
            // value = searchController.text;
          });
        },
        // controller: searchController,
        cursorColor: Colors.grey,
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
          suffixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
}
