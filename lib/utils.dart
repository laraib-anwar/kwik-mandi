import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

AppBar newAppBar(String heading, context) {
  return AppBar(
      title: Center(
        child: Text(
          heading,
          style:
              const TextStyle(color: Colors.white, fontSize: headerFontSize),
        ),
      ),
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor,
      ));
}

AppBarTheme AppTheme() {
  return const AppBarTheme(
    color: kPrimaryColor,
    foregroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.green,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}




