import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwik_mandi/components/gap.dart';
import 'package:kwik_mandi/components/goBack.dart';
import 'package:kwik_mandi/components/midGap.dart';
import 'package:kwik_mandi/components/separator.dart';
import 'package:kwik_mandi/components/textDisplay.dart';

import '../../constants.dart';

class AccountBody extends StatelessWidget {
  AccountBody({
    super.key,
  });

  List<Map<String, dynamic>> myOrders = [
    {
      "id": 1,
      "name": "Delight Burger",
      "address": "ripon st",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
      "orders": [
        {'itemName': 'burger', 'quantity': 2},
        {'itemName': 'coke', 'quantity': 3}
      ],
      "createdAt": "12 March,2023, 09:01 PM",
      "status": "OnGoing"
    },
    {
      "id": 2,
      "name": "Delight Burger",
      "address": "ripon st",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
      "orders": [
        {'itemName': 'burger', 'quantity': 2},
      ],
      "createdAt": "12 March,2023, 09:01 PM",
      "status": "Delivered"
    },
    {
      "id": 3,
      "name": "Delight Burger",
      "address": "ripon st",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
      "orders": [
        {'itemName': 'burger', 'quantity': 2},
        {'itemName': 'coke', 'quantity': 3},
        {'itemName': 'pizza', 'quantity': 4},
      ],
      "createdAt": "12 March,2023, 09:01 PM",
      "status": "OnGoing"
    },
    {
      "id": 4,
      "name": "Delight Burger",
      "address": "ripon st",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
      "orders": [
        {'itemName': 'burger', 'quantity': 2},
        {'itemName': 'coke', 'quantity': 3},
        {'itemName': 'pizza', 'quantity': 4},
        {'itemName': 'chicken', 'quantity': 5},
      ],
      "createdAt": "12 March,2023, 09:01 PM",
      "status": "Delivered"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GoBack(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextDisplay(
                    header: "Laraib",
                    color: kGrey1,
                    fs: 16,
                    fw: FontWeight.w600),
                TextDisplay(
                    header: "Edit",
                    color: kPrimaryColor,
                    fs: 12,
                    fw: FontWeight.w600),
              ],
            ),
            const TextDisplay(
                header: "91123456789-laraib.anwar9@gmail.com",
                color: kGrey3,
                fs: 12,
                fw: FontWeight.w500),
            const Gap(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    accountRow("My account", 'assets/icons/user.svg',
                        'Favorites & settings'),
                    const MidGap(),
                    const Separator(),
                    const MidGap(),
                    accountRow("Address", 'assets/icons/location.svg',
                        'Edit/add new address'),
                    const MidGap(),
                    const Separator(),
                    const MidGap(),
                    accountRow("Offers", 'assets/icons/discount.svg',
                        'Coupons and discounts'),
                    const MidGap(),
                    const Separator(),
                    const MidGap(),
                    accountRow(
                        "Help", 'assets/icons/headset.svg', 'FAQS and link'),
                  ],
                ),
              ),
            ),
            const Gap(),
            codLimit(),
            const Gap(),
            referral(),
            const Gap(),
            const TextDisplay(
                header: 'My Orders',
                color: kGrey1,
                fs: 16,
                fw: FontWeight.w600),
            SizedBox(
              height: myOrders.length * 220,
              child: myOrdersList(),
            )
          ],
        ),
      ),
    );
  }

  ListView myOrdersList() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: myOrders.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              orderCard(index),
            ],
          );
        });
  }

  Card orderCard(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDisplay(
                    header: myOrders[index]['name'],
                    color: Colors.black,
                    fs: 14,
                    fw: FontWeight.w600),
                TextDisplay(
                    header: myOrders[index]['status'],
                    color: myOrders[index]['status'] == "OnGoing"
                        ? Colors.blue
                        : Colors.green,
                    fs: 12,
                    fw: FontWeight.w500),
              ],
            ),
            const MidGap(),
            TextDisplay(
                header: myOrders[index]['address'],
                color: kGrey3,
                fs: 12,
                fw: FontWeight.w400),
            const MidGap(),
            TextDisplay(
                header: '\u{20B9} ${myOrders[index]['price']}',
                color: kGrey3,
                fs: 12,
                fw: FontWeight.w400),
            const MidGap(),
            TextDisplay(
                header: myOrders[index]['description'],
                color: kGrey3,
                fs: 14,
                fw: FontWeight.w400),
            const Gap(),
            // SizedBox(
            //   height: double.parse((myOrders[index]['orders'].length * 10).toString()),
            //   child: ListView.builder(
            //       itemCount: myOrders[index]['orders'].length,
            //       itemBuilder: (context, i) {
            //         final item = myOrders[index]['orders'][i];
            //         return Column(
            //           children: [
            //             orderItemRow(item),
            //           ],
            //         );
            //       }),
            // ),
            const MidGap(),
            TextDisplay(
                header: myOrders[index]['createdAt'],
                color: kGrey3,
                fs: 12,
                fw: FontWeight.w400),
            const MidGap(),
            myOrders[index]['status'] == "OnGoing"
                ? cardButtonOrder('Track Order')
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cardButtonOrder('ReOrder'),
                      cardButtonOrder('Track Order'),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Row orderItemRow(item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextDisplay(
            header: item.itemName, color: kGrey3, fs: 14, fw: FontWeight.w400),
        TextDisplay(
            header: 'X ${item.itemName}',
            color: kGrey3,
            fs: 14,
            fw: FontWeight.w400),
      ],
    );
  }

  Card cardButtonOrder(String title) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: title == "Track Order"
              ? kPrimaryColor
              : Colors.black, //<-- SEE HERE
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextDisplay(
            header: title,
            color: title == "Track Order" ? kPrimaryColor : Colors.black,
            fs: 12,
            fw: FontWeight.w800),
      ),
    );
  }

  Card referral() {
    return const Card(
        color: kPrimaryColor,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: TextDisplay(
                header: 'Referral',
                color: Colors.white,
                fs: 18,
                fw: FontWeight.w600),
          ),
        ));
  }

  Card codLimit() {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              TextDisplay(
                  header: 'Your COD limit',
                  color: kGrey3,
                  fs: 12,
                  fw: FontWeight.w500),
              TextDisplay(
                  header: '\u{20B9}8000',
                  color: kGrey1,
                  fs: 16,
                  fw: FontWeight.w600),
            ],
          ),
          const TextDisplay(
              header: 'Increase limit',
              color: kPrimaryColor,
              fs: 12,
              fw: FontWeight.w600),
        ],
      ),
    ));
  }

  GestureDetector accountRow(String title, String icon, String subtitle) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: SvgPicture.asset(icon)),
          // const SizedBox(width: 8),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextDisplay(
                    header: title, color: kGrey2, fs: 14, fw: FontWeight.w600),
                TextDisplay(
                    header: subtitle,
                    color: kGrey3,
                    fs: 12,
                    fw: FontWeight.w400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
