import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwik_mandi/components/customTab.dart';
import 'package:kwik_mandi/components/midGap.dart';
import 'package:kwik_mandi/components/separator.dart';

import '../../components/gap.dart';
import '../../components/goBack.dart';

import '../../components/listPresent.dart';
import '../../components/search.dart';

import '../../components/textDisplay.dart';
import '../../constants.dart';
import '../../utils.dart';

class ShopDetails extends StatefulWidget {
  final shop;
  const ShopDetails({
    required this.shop,
    Key? key,
  }) : super(key: key);

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  String detail = '';
  bool selected = true;
  int index = 1;
  List<String> offers = [
    "assets/images/offer.png",
    "assets/images/offer.png",
    "assets/images/offer.png"
  ];
  List<String> quicks = [
    "assets/images/butterChicken.png",
    "assets/images/pasta.png",
    "assets/images/butterChicken.png"
  ];
  List<String> category = [
    "assets/images/biryani.png",
    "assets/images/chowmein.png",
    "assets/images/burger.png",
    "assets/images/biryani.png",
    "assets/images/chowmein.png",
    "assets/images/burger.png",
  ];
  List<Map<String, dynamic>> products = [
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
      "id": 3,
      "name": "Chicken",
      "img": "assets/images/chicken-1.png",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
    },
    {
      "id": 4,
      "name": "Chicken Fries",
      "img": "assets/images/chicken-2.png",
      "price": "120",
      "description": "Our best selling product. Fast delivery!",
    },
  ];
  List<bool> isClicked = [];
  List<int> counter = [];

  @override
  Widget build(BuildContext context) {
    isClicked.add(false);
    isClicked.add(false);
    isClicked.add(false);
    isClicked.add(false);

    counter.add(0);
    counter.add(0);

    counter.add(0);
    counter.add(0);


    detail = widget.shop['time'] +
        ' ' +
        widget.shop['rating'] +
        " " +
        widget.shop['distance'];
    return Scaffold(
      appBar: newAppBar("Details", context),
      body: newShopBody(),
    );
  }

  SingleChildScrollView newShopBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GoBack(),
                SvgPicture.asset("assets/icons/favorite.svg")
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Stack(alignment: Alignment.bottomCenter, children: [
                    Image.asset(
                      widget.shop['img'],
                      width: 60,
                      height: 60,
                    ),
                    badges.Badge(
                      badgeContent: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              widget.shop['rating'],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                            const SizedBox(width: 3),
                            SvgPicture.asset("assets/icons/star_white.svg",
                                height: 7, width: 7)
                          ]),
                      badgeColor: Colors.green,
                      shape: badges.BadgeShape.square,
                      borderRadius: BorderRadius.circular(8),
                      padding: const EdgeInsets.all(4),
                    )
                  ]),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDisplay(
                          header: widget.shop['name'],
                          color: kGrey1,
                          fs: 18,
                          fw: FontWeight.w600),
                      TextDisplay(
                          header: detail,
                          color: kGrey3,
                          fs: 12,
                          fw: FontWeight.w400),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Search(),
            const Gap(),
            const Gap(),
            const TextDisplay(
                header: "Top Offers",
                color: kGrey1,
                fs: 20,
                fw: FontWeight.w600),
            const Gap(),
            SizedBox(
              height: 150,
              child: ListPresent(list: offers, wd: 265, hg: 156),
            ),
            const Gap(),
            const Gap(),
            const TextDisplay(
                header: "Quick Add",
                color: kGrey1,
                fs: 20,
                fw: FontWeight.w600),
            const Gap(),
            SizedBox(
              height: 170,
              child: ListPresent(
                list: quicks,
                wd: 134,
                hg: 71,
                add: true,
              ),
            ),
            const MidGap(),
            const Separator(),
            const MidGap(),
            const Gap(),
            const TextDisplay(
                header: "Order By category",
                color: kGrey1,
                fs: 20,
                fw: FontWeight.w600),
            SizedBox(
              height: 100,
              child: ListPresent(list: category, wd: 60, hg: 56),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryTabs("All", 1),
                  categoryTabs("Grocery", 2),
                  categoryTabs("Drinks", 3),
                  categoryTabs("Cosmetics", 4),
                ],
              ),
            ),
            const Gap(),
            const TextDisplay(
                header: "Products",
                color: kGrey1,
                fs: 18,
                fw: FontWeight.w600),
            const Gap(),
            SizedBox(
              height: 500,
              child: displayProducts(),
            )
          ],
        ),
      ),
    );
  }

  ListView displayProducts() {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextDisplay(
                            header: products[index]['name'],
                            color: kGrey1,
                            fs: 16,
                            fw: FontWeight.w500),
                        const MidGap(),
                        TextDisplay(
                            header: '\u{20B9}${products[index]['price']}',
                            color: kGrey1,
                            fs: 14,
                            fw: FontWeight.w500),
                        const MidGap(),
                        TextDisplay(
                            header: products[index]['description'],
                            color: kGrey5,
                            fs: 12,
                            fw: FontWeight.w400),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Image.asset(
                          products[index]['img'],
                          width: 110,
                          height: 110,
                        ),
                        Positioned(
                          top: 70,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isClicked[index] = !isClicked[index];
                                });
                              },
                              child: isClicked[index] == false
                                  ? const CustomTab(header: 'Add', wd: 101,)
                                  : const CustomTab(header: '',add:true, wd: 101),
                        ))
                      ]))
                ],
              ),
              const MidGap(),
              const Separator()
            ],
          );
        }));
  }

  GestureDetector categoryTabs(String header, int ind) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = true;
          index = ind;
        });
      },
      child: Container(
        margin: const EdgeInsets.all((20)),
        padding: const EdgeInsets.symmetric(
          horizontal: (10),
          vertical: (10),
        ),
        decoration: BoxDecoration(
          color: selected == true && index == ind
              ? kPrimaryColor
              : kTextFieldColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          header,
          style: TextStyle(
              color: selected == true && index == ind ? Colors.white : kGrey3),
        ),
      ),
    );
  }
}
