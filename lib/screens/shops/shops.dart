import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwik_mandi/components/gap.dart';
import 'package:kwik_mandi/components/separator.dart';
import 'package:kwik_mandi/constants.dart';
import 'package:kwik_mandi/screens/shopDetails/shopDetails.dart';



import '../../components/listPresent.dart';
import '../../components/search.dart';

import '../../components/textDisplay.dart';

class ShopsBody extends StatefulWidget {
  const ShopsBody({super.key});

  @override
  State<ShopsBody> createState() => _ShopsBodyState();
}

class _ShopsBodyState extends State<ShopsBody> {
  String heading = "Ripon Street";
  bool isDel = true, isRate = false;
  List<String> info = [
    "assets/images/infoCarausel.png",
    "assets/images/infoCarausel.png",
    "assets/images/infoCarausel.png"
  ];
  List<String> category = [
    "assets/images/biryani.png",
    "assets/images/chowmein.png",
    "assets/images/burger.png",
    "assets/images/biryani.png",
    "assets/images/chowmein.png",
    "assets/images/burger.png",
  ];
  List<String> offers = [
    "assets/images/offer.png",
    "assets/images/offer.png",
    "assets/images/offer.png"
  ];

  List<Map<String, dynamic>> favShops = [
    {
      "id": 1,
      "name": "Shop A",
      "img": "assets/images/shop1.png",
      "time": "20 mins",
      "discount": "30",
      "rating": "4.5",
      "distance": "5 kms",
    },
    {
      "id": 2,
      "name": "Shop B",
      "img": "assets/images/shop2.png",
      "time": "20 mins",
      "discount": "30",
      "rating": "4.5",
      "distance": "5 kms"
    },
    {
      "id": 3,
      "name": "Shop C",
      "img": "assets/images/shop3.png",
      "time": "20 mins",
      "discount": "30",
      "rating": "4.5",
      "distance": "5 kms"
    },
    {
      "id": 4,
      "name": "Shop D",
      "img": "assets/images/shop4.png",
      "time": "20 mins",
      "discount": "30",
      "rating": "4.5",
      "distance": "5 kms"
    },
  ];

  List<Map<String, dynamic>> nearShops = [
    {
      "id": 5,
      "name": "Shop E",
      "img": "assets/images/shop5.png",
      "time": "20 mins",
      "rating": "4.5",
      "distance": "5 kms"
    },
    {
      "id": 6,
      "name": "Shop F",
      "img": "assets/images/shop6.png",
      "time": "20 mins",
      "rating": "4.5",
      "distance": "5 kms"
    },
    {
      "id": 7,
      "name": "Shop G",
      "img": "assets/images/shop7.png",
      "time": "20 mins",
      "rating": "4.5",
      "distance": "5 kms"
    },
    {
      "id": 8,
      "name": "Shop H",
      "img": "assets/images/shop8.png",
      "time": "20-25 mins",
      "rating": "4.5",
      "distance": "5 kms"
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
           
             const TextDisplay(
                header: 'Ripon Street',
                color: kGrey1,
                fs: 18,
                fw: FontWeight.w600),
            const TextDisplay(
                header: "J92M+P72,Kolkata Station road",
                color: kGrey3,
                fs: 12,
                fw: FontWeight.w400),
            const Gap(),
            const Separator(),
            const Gap(),
            SizedBox(
              height: 150,
              child: ListPresent(list: info, wd: 323, hg: 238),
            ),
            const Gap(),
            const Search(),
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
                  filterTabs("Filter", true),
                  filterTabs("Delivery Time", false),
                  filterTabs("Trending", false),
                  filterTabs("Recent", false),
                ],
              ),
            ),
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
            const TextDisplay(
                header: "Your Favorite Shops",
                color: kGrey1,
                fs: 20,
                fw: FontWeight.w600),
            const Gap(),
            SizedBox(
              height: 300,
              child: displayRestaurants(favShops, 61, 61, true),
            ),
            const Separator(),
            const Gap(),
            const TextDisplay(
                header: "Shop near you",
                color: kGrey1,
                fs: 20,
                fw: FontWeight.w600),
            const Gap(),
            SizedBox(
              height: 350,
              child: displayRestaurants(nearShops, 80, 80, false),
            ),
            const Gap(),
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Container filterTabs(String txt, icn) {
    return Container(
      margin: const EdgeInsets.all((10)),
      padding: const EdgeInsets.symmetric(
        horizontal: (10),
        vertical: (10),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: kTextFieldColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (icn == true) {
                showModal();
              }
            },
            child: Text(
              txt,
              style:
                  const TextStyle(color: kGrey2, fontWeight: FontWeight.w600),
            ),
          ),
          //SizedBox(width: 1)
          icn == true
              ? SvgPicture.asset('assets/icons/filter.svg')
              : const SizedBox(width: 1)
        ],
      ),
    );
  }

  ListView displayRestaurants(list, double wd, double hg, isFav) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => ShopDetails(shop: list[index])),
                    (route) => true);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: isFav == true
                    ? Row(
                        children: [
                          Image.asset(
                            list[index]['img'],
                            width: wd,
                            height: hg,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                               TextDisplay(
                                  header: list[index]['name'],
                                  color: kGrey1,
                                  fs: 14,
                                  fw: FontWeight.w500),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/fade_time.svg"),
                                  const SizedBox(width: 2),
                                  TextDisplay(
                                      header: list[index]['time'],
                                      color: kGrey1,
                                      fs: 12,
                                      fw: FontWeight.w400)
                                ],
                              ),
                              TextDisplay(
                                  header:
                                      "upto ${list[index]['discount']}% of discount",
                                  color: kPrimaryColor,
                                  fs: 12,
                                  fw: FontWeight.w400)
                            ],
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Image.asset(
                            list[index]['img'],
                            width: wd,
                            height: hg,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                               TextDisplay(
                                  header: list[index]['name'],
                                  color: kGrey1,
                                  fs: 14,
                                  fw: FontWeight.w500),
                              TextDisplay(
                                  header: list[index]['distance'],
                                  color: kGrey3,
                                  fs: 12,
                                  fw: FontWeight.w400),
                              TextDisplay(
                                  header: list[index]['time'],
                                  color: kGrey3,
                                  fs: 12,
                                  fw: FontWeight.w400),
                              Row(
                                children: [
                                  TextDisplay(
                                      header: list[index]['rating'],
                                      color: kGrey3,
                                      fs: 12,
                                      fw: FontWeight.w400),
                                  const SizedBox(width: 2),
                                  SvgPicture.asset("assets/icons/rate_grey.svg")
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 8)
          ],
        );
      },
    );
  }

  void showModal() {
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
                    // const NormalGap(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Filter',
                            style: TextStyle(
                                color: kGrey1,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            'X',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    //const NormalGap(),
                    const Separator(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //  const SizedBox(height: 20),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isDel = true;
                                      isRate = false;
                                    });
                                  },
                                  child: Text('Delivery Time',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: isDel == true
                                              ? kPrimaryColor
                                              : Colors.black,
                                          fontWeight: FontWeight.w500))),
                              const SizedBox(height: 22),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDel = false;
                                    isRate = true;
                                  });
                                },
                                child: Text('Ratings',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: isRate == true
                                            ? kPrimaryColor
                                            : Colors.black,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                        //const SizedBox(width:5),
                        const VerticalDivider(
                          width: 20,
                          thickness: 1,
                          color: kDivider,
                        ),
                        //const SizedBox(width: 5),

                        isDel == true && isRate == false
                            ? Expanded(flex: 4, child: showDelivery())
                            : Expanded(flex: 4, child: showRatings()),
                      ],
                    ),
                    const Separator(),
                    const Gap(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Clear Filters',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor)),
                        ),
                        TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        kPrimaryColor),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(220, 45))),
                            child: const Text('Apply',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  Widget showDelivery() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
        height: 200,
        child: Column(
          children: [
           
             const TextDisplay(
                header: "Filter By Delivery",
                color: kGrey1,
                fs: 14,
                fw: FontWeight.w500),
            deliverFilter("Fast Delivery", true),
            deliverFilter("Less than 45 mins", false),
          ],
        ),
      );
    });
  }

  StatefulBuilder showRatings() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
        height: 200,
        child: Column(
          children: [
          
            const  TextDisplay(
                header: "Filter By ratings",
                color: kGrey1,
                fs: 14,
                fw: FontWeight.w500),
            const Gap(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  StatefulBuilder deliverFilter(String header, bool toggle) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(header, style: const TextStyle(fontSize: 14, color: kGrey1)),
        Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            checkColor: Colors.white,
            activeColor: kPrimaryColor,
            value: toggle,
            onChanged: (bool? value) {
              setState(() {
                toggle = !toggle;
              });
            })
      ]);
    });
  }
}
