import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwik_mandi/constants.dart';
import 'package:kwik_mandi/routes.dart';
import 'package:kwik_mandi/screens/authScreen/loginEmail.dart';
import 'package:kwik_mandi/screens/home/home.dart';
import 'package:kwik_mandi/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Few Minutes',
      initialRoute: LoginEmailScreen.routeName,
      routes: routes,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,

        fontFamily: 'Poppins',
        
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
        ),
         appBarTheme: AppTheme(),
      ),
      //home: const MyHomePage(title: 'Few Minutes'),

    );
  }

 
}

