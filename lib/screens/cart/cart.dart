import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwik_mandi/components/customTab.dart';
import 'package:kwik_mandi/components/gap.dart';
import 'package:kwik_mandi/components/listPresent.dart';
import 'package:kwik_mandi/components/separator.dart';
import 'package:kwik_mandi/components/textDisplay.dart';
import 'package:kwik_mandi/constants.dart';
import 'package:kwik_mandi/screens/address/address.dart';

import '../../components/goBack.dart';
import '../../components/titleAppBar.dart';
import '../payment/payment.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cart = [
    {
      "id": 1,
      "name": "Delight Burger",
      "img": "assets/images/burger-1.png",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
    },
    {
      "id": 2,
      "name": "Burger",
      "img": "assets/images/burger-2.png",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
    },
    {
      "id": 2,
      "name": "Burger",
      "img": "assets/images/burger-2.png",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
    },
    {
      "id": 2,
      "name": "Burger",
      "img": "assets/images/burger-2.png",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
    },
    {
      "id": 2,
      "name": "Burger",
      "img": "assets/images/burger-2.png",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
    },
    {
      "id": 2,
      "name": "Burger",
      "img": "assets/images/burger-2.png",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
    },
  ];
  String customerAddress = "Plot no 74, Ripon Street";
  @override
  Widget build(BuildContext context) {
    return cartBody();
  }

  SingleChildScrollView cartBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextDisplay(
                header: 'Delight Cafe',
                color: kGrey1,
                fs: 18,
                fw: FontWeight.w600),
            const Gap(),
            containerBox(),
            const Gap(),
            couponBox(),
            const Gap(),
            billDetailBox(),
            const Gap(),
            cancelPolicyBox(),
            const Gap(),
            const Separator(),
            const Gap(),
            addressDelivery(),
            const Gap(),
            const Separator(),
            const Gap(),
            paymentWidget()
          ],
        ),
      ),
    );
  }

  Row paymentWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const TextDisplay(
          header: "\u{20B9}3500", color: kGrey1, fs: 14, fw: FontWeight.w600),
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
        onPressed: () {
          showPaymentModal();
        },
        child: const TextDisplay(
          header: "Proceed to Pay",
          color: Colors.white,
          fs: 12,
          fw: FontWeight.w800,
        ),
      ),
    ]);
  }

  Row addressDelivery() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        children: const [
          TextDisplay(
              header: "Delivering in 10 mins",
              color: kGrey1,
              fs: 14,
              fw: FontWeight.w600),
          TextDisplay(
              header: "Plot no 74, Ripon Street",
              color: kGrey3,
              fs: 12,
              fw: FontWeight.w400),
        ],
      ),
      Container(
        padding: const EdgeInsets.all(5),
        width: 58,
        height: 39,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: kGrey6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/icons/address.svg'),
            GestureDetector(
              onTap: () {
                showAddressModal();
              },
              child: SvgPicture.asset(
                'assets/icons/rightArrow.svg',
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      )
    ]);
  }

  Container cancelPolicyBox() {
    return Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 104,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kTextFieldColor)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/policy.svg'),
                    const SizedBox(width: 5),
                    const TextDisplay(
                        header: "Cancellation Policy",
                        color: kGrey1,
                        fs: 14,
                        fw: FontWeight.w600),
                  ],
                ),
                const Gap(),
                SvgPicture.asset('assets/icons/rightArrow.svg'),
              ],
            ),
            const TextDisplay(
                header:
                    "If you cancel items after 60 seconds full fess will be deducted",
                color: kGrey3,
                fs: 12,
                fw: FontWeight.w400)
          ],
        ));
  }

  Container billDetailBox() {
    return Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 270,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kTextFieldColor)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextDisplay(
                header: 'Bill Details',
                color: kGrey1,
                fs: 14,
                fw: FontWeight.w600),
            billRow("Item total", "3000"),
            const Gap(),
            billRow("Delivery fee", "30"),
            const Gap(),
            billRow("Coupon used", "-50"),
            const Gap(),
            billRow("Taxes and charges", "80"),
            const Gap(),
            const Separator(),
            const Gap(),
            Container(
                height: 53,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(color: kGrey6),
                    color: kGrey6,
                    borderRadius: BorderRadius.circular(8)),
                child: billRow("Total", "3070")),
          ],
        ));
  }

  Row billRow(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextDisplay(header: title, color: kGrey3, fs: 12, fw: FontWeight.w500),
        TextDisplay(
            header: "\u{20B9}$price",
            color: title == "Coupon used" ? Colors.green : kGrey3,
            fs: 12,
            fw: FontWeight.w500),
      ],
    );
  }

  Container couponBox() {
    return Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 53,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kTextFieldColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/coupon1.svg'),
                const SizedBox(width: 5),
                const TextDisplay(
                    header: "Apply Coupon",
                    color: kGrey1,
                    fs: 14,
                    fw: FontWeight.w600),
              ],
            ),
            const Gap(),
            SvgPicture.asset('assets/icons/rightArrow.svg'),
          ],
        ));
  }

  Container containerBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: double.parse(cart.length.toString()) * 42 +
          32 +
          double.parse(cart.length.toString()) * 18,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kTextFieldColor)),
      child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextDisplay(
                          header: cart[index]['name'],
                          color: kGrey1,
                          fs: 14,
                          fw: FontWeight.w500),
                    ),
                    const Expanded(
                        flex: 3,
                        child: CustomTab(header: '', add: true, wd: 101)),
                    Expanded(
                      flex: 2,
                      child: TextDisplay(
                          header: "\u{20B9}${cart[index]['price']}",
                          color: kGrey1,
                          fs: 14,
                          fw: FontWeight.w500),
                    )
                  ],
                )
              ],
            );
          }),
    );
  }

  void showAddressModal() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return customerAddress.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 550,
                      child: Column(
                        children: [
                          const Gap(),
                          const TitleAppBar(title: "Choose Address"),
                          const Gap(),

                          addressRow("Home", 'assets/icons/home.svg'),
                          const Gap(),
                          const Separator(),
                          const Gap(),
                          addressRow("Work", "assets/icons/address.svg"),
                          const Gap(),
                          const Separator(),
                          const Gap(),

                          addressRow("Other", "assets/icons/locationAlt.svg"),
                          const Gap(),
                          const Separator(),
                          const Gap(),

                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => Address()),
                                    (route) => true);
                              },
                              child: const TextDisplay(
                                  header: "+ add new address",
                                  color: kPrimaryColor,
                                  fs: 14,
                                  fw: FontWeight.w600))
                          //const NormalGap(),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: kGrey5,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: SvgPicture.asset("assets/icons/marker.svg",
                                width: 24, height: 24, color: kGrey5),
                          )),
                      const SizedBox(height: 6),
                      Center(
                          child: Column(children: [
                        const TextDisplay(
                            header: "NO ADDRESS",
                            color: kGrey1,
                            fs: 12,
                            fw: FontWeight.w600),
                        const TextDisplay(
                            header: "You haven't saved any address",
                            color: kGrey3,
                            fs: 12,
                            fw: FontWeight.w300),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Address()),
                                (route) => true);
                          },
                          child: const TextDisplay(
                              header: "+ add new address",
                              color: kPrimaryColor,
                              fs: 14,
                              fw: FontWeight.w600),
                        )
                      ]))
                    ]),
                  );
          });
        });
  }

  Column addressRow(String name, String icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    icon,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(width: 6),
                  TextDisplay(
                      header: name, color: kGrey1, fs: 18, fw: FontWeight.w600),
                ],
              ),
              TextDisplay(
                  header: customerAddress,
                  color: kGrey3,
                  fs: 14,
                  fw: FontWeight.w400)
            ],
          ),
        ),
      ],
    );
  }

  void showPaymentModal() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 550,
                child: Column(
                  children: [
                    const Gap(),
                    const TitleAppBar(title: "Choose Payment method"),
                    const Gap(),

                    GestureDetector(
                        onTap: () {
                          switchToPayment();
                        },
                        child: addressRow(
                            "Pay Online", 'assets/icons/payment.svg')),
                    const Gap(),
                    const Separator(),
                    const Gap(),
                    GestureDetector(
                        onTap: () {
                          switchToPayment();
                        },
                        child: addressRow("COD", "assets/icons/payment.svg")),
                    const Gap(),
                    const Separator(),
                    const Gap(),

                    //const NormalGap(),
                  ],
                ),
              ),
            );
          });
        });
  }

  void switchToPayment() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Payment()), (route) => true);
  }
}
