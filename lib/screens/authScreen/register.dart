import 'package:flutter/material.dart';
import 'package:kwik_mandi/components/gap.dart';
import 'package:kwik_mandi/components/textDisplay.dart';

import '../../components/midGap.dart';
import '../../constants.dart';
import 'loginEmail.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                children: const [
                  TextDisplay(
                      header: "Register",
                      color: Colors.white,
                      fs: 20,
                      fw: FontWeight.w600),
                  SizedBox(
                    height: 10,
                  ),
                  TextDisplay(
                      header: "Welcome to FewMinutes",
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
                            signInField('Name'),
                            const MidGap(),

                            signInField('Email'),
                        
                            const MidGap(),
                            signInField('Phone Number'),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      
                        GestureDetector(
                           onTap: () {},
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: gradientColor()),
                            child: const Center(
                                child: TextDisplay(
                                    header: 'Register',
                                    color: Colors.white,
                                    fs: 18,
                                    fw: FontWeight.w600)),
                          ),
                        ),
                        const Gap(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, LoginEmailScreen.routeName);
                          },
                          child: const TextDisplay(
                              header: "Already have an account? Login!",
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
