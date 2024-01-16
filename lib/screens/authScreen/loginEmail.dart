import 'package:flutter/material.dart';
import 'package:kwik_mandi/components/gap.dart';
import 'package:kwik_mandi/components/separator.dart';
import 'package:kwik_mandi/components/textDisplay.dart';
import 'package:kwik_mandi/screens/authScreen/register.dart';

import '../../components/midGap.dart';
import '../../constants.dart';
import '../home/home.dart';

class LoginEmailScreen extends StatefulWidget {
  static String routeName = "/";

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  String currentRoute = LoginEmailScreen.routeName;
  bool isLoginSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: gradientColor()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDisplay(
                      header: isLoginSwitched
                          ? "Login using Phone"
                          : "Login using Email",
                      color: Colors.white,
                      fs: 20,
                      fw: FontWeight.w600),
                  const Gap(),
                  const TextDisplay(
                      header: "Welcome Back to FewMinutes",
                      color: Colors.white,
                      fs: 12,
                      fw: FontWeight.w400)
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Column(
                          children: [
                            isLoginSwitched == false
                                ? signInField('Email')
                                : signInField('Phone Number'),
                            const MidGap(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLoginSwitched = !isLoginSwitched;
                                });
                                if (isLoginSwitched == true) {
                                 
                                  setState(() {
                                    LoginEmailScreen.routeName = '/';
                                    currentRoute = LoginEmailScreen.routeName;
                                  });
                                } else if (isLoginSwitched == false) {
                                  
                               setState(() {
                                 
                                    LoginEmailScreen.routeName = '/';
                                    currentRoute = LoginEmailScreen.routeName;
                               });
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const TextDisplay(
                                      header: "Or Login Using ",
                                      color: kGrey1,
                                      fs: 12,
                                      fw: FontWeight.w600),
                                  isLoginSwitched == false
                                      ? const Icon(Icons.smartphone)
                                      : const Icon(Icons.email)
                                ],
                              ),
                            ),
                            const MidGap(),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: gradientColor()),
                            child: Center(
                                child: TextDisplay(
                                    header: isLoginSwitched == false
                                        ? 'Login via Email'
                                        : 'Login via Phone',
                                    color: Colors.white,
                                    fs: 18,
                                    fw: FontWeight.w600)),
                          ),
                        ),
                        const Gap(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: const TextDisplay(
                              header: "Don't have an account? Signup!",
                              color: kGrey2,
                              fs: 14,
                              fw: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container signInField(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kTextFieldColor)),
      child: TextField(
        decoration: InputDecoration(
            hintText: title,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }

  LinearGradient gradientColor() {
    return const LinearGradient(begin: Alignment.topCenter, colors: [
      Color.fromRGBO(132, 35, 93, 1),
      Color.fromRGBO(178, 33, 120, 1),
    ]);
  }
}
