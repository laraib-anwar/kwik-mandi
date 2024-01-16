import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwik_mandi/components/gap.dart';
import 'package:kwik_mandi/components/textDisplay.dart';

import '../../constants.dart';

class AddressBody extends StatefulWidget {
  const AddressBody({
    super.key,
  });

  @override
  State<AddressBody> createState() => _AddressBodyState();
}

class _AddressBodyState extends State<AddressBody> {
  String customerAddress = "Plot no 74, Ripon Street";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 165,
              color: kPrimaryColor,
              child: const Center(
                child: TextDisplay(
                    header: "Show user's location using google map in here",
                    color: Colors.white,
                    fs: 14,
                    fw: FontWeight.w400),
              ),
            ),
            const Gap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/location.svg',
                  color: kPrimaryColor,
                ),
                const SizedBox(width: 8),
                const TextDisplay(
                    header: "Ripon Street",
                    color: kGrey1,
                    fs: 18,
                    fw: FontWeight.w600),
              ],
            ),
            const Gap(),
            TextDisplay(
                header: customerAddress,
                color: kGrey3,
                fs: 14,
                fw: FontWeight.w400),
            const Gap(),
            textInput("House no/Flat no"),
            const Gap(),
            textInput("Apartment/Road area"),
            const Gap(),
            textInput("Direction to reach"),
            const Gap(),
            const TextDisplay(
                header: "Save as", color: kGrey1, fs: 14, fw: FontWeight.w600),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryTabs("Home", "assets/icons/home.svg"),
                categoryTabs("Work", "assets/icons/address.svg"),
                categoryTabs("Other", "assets/icons/locationAlt.svg"),
              ],
            ),
            const Gap(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(400, 30),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const TextDisplay(
                header: "Save Details",
                color: Colors.white,
                fs: 16,
                fw: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding textInput(String placeholder) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        //controller: ,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: kTextFieldColor),
          ),
          focusedBorder: InputBorder.none,
          hintText: placeholder,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  GestureDetector categoryTabs(
    String header,
    String icon,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        //  margin: const EdgeInsets.all((20)),
        padding: const EdgeInsets.symmetric(
          horizontal: (10),
          vertical: (10),
        ),
        decoration: BoxDecoration(
          color: kGrey6,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kGrey3,
            ),
            TextDisplay(
                header: header, color: kGrey3, fs: 16, fw: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
