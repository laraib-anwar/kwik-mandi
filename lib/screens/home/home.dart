import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwik_mandi/screens/account.dart/account.dart';
import 'package:kwik_mandi/screens/cart/cart.dart';
import 'package:kwik_mandi/screens/shops/shops.dart';
import 'package:kwik_mandi/utils.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String heading = "Home",title="Few Minutes";
  @override
  Widget build(BuildContext context) {
    final bottomTabs = [
      const ShopsBody(),
    const Cart(),
    const Account()
    ];
   

    if (selectedIndex == 0) {
      heading = "Home";
    } else if (selectedIndex == 1) {
      heading = "Cart";
    } else if (selectedIndex == 2) {
      heading = "Account";
    }
    return Scaffold(
      appBar: newAppBar(title, context),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        //backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        selectedItemColor: kPrimaryColor,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              width: 24,
              height: 24,
              color: selectedIndex == 0 ? kPrimaryColor : kGrey3,
            ),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            //icon: SvgPicture.asset("assets/icons/historyIcon.svg",width: 24, height: 24, color:selectedIndex==3 ? kPrimaryColor:kGrey3),
            icon: Icon(Icons.shopping_cart_sharp,
                size: 24,
                color: selectedIndex == 1 ? kPrimaryColor : kGrey3),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            //icon: SvgPicture.asset("assets/icons/historyIcon.svg",width: 24, height: 24, color:selectedIndex==3 ? kPrimaryColor:kGrey3),
            icon: Icon(Icons.account_circle,size: 24,
                color: selectedIndex == 2 ? kPrimaryColor : kGrey3),
            label: 'Account',
          ),
        ],
      ),
      body: bottomTabs[selectedIndex],
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
