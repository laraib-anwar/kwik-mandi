import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/textDisplay.dart';
import '../../constants.dart';
import '../../utils.dart';


class Payment extends StatelessWidget {
  const Payment({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppBar("Address", context),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kGrey5,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset("assets/icons/paymentSuccess.svg",
                    width: 24, height: 24),
              )),
          const SizedBox(height: 6),
          Center(
              child: Column(children: const[
            TextDisplay(
                header: "Order received!",
                color: kGrey1,
                fs: 20,
                fw: FontWeight.w600),
             TextDisplay(
                header: "Your order will be delivered shortly.",
                color: kGrey3,
                fs: 16,
                fw: FontWeight.w400),
           
          ]))
        ]),
      ),
    );
  }
}
