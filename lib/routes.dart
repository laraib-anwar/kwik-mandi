import 'package:flutter/widgets.dart';
import 'package:kwik_mandi/screens/authScreen/loginEmail.dart';
import 'package:kwik_mandi/screens/authScreen/register.dart';
import 'package:kwik_mandi/screens/home/home.dart';

final Map<String, WidgetBuilder> routes = {
  LoginEmailScreen.routeName: (context) => LoginEmailScreen(),

   RegisterScreen.routeName: (context) => RegisterScreen(),
   HomeScreen.routeName: (context) => const HomeScreen(),
};
