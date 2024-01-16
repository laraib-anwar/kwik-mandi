import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwik_mandi/components/customTab.dart';
import 'package:kwik_mandi/components/midGap.dart';
import 'package:kwik_mandi/components/separator.dart';

import '../../components/gap.dart';
import '../../components/goBack.dart';
import '../../components/textDisplay.dart';
import '../../constants.dart';
import '../../utils.dart';
import 'addressBody.dart';


class Address extends StatelessWidget {

   Address({
 
    Key? key,
  }) : super(key: key);

  String detail = '';

  bool selected = true;

  int index = 1;

  List<bool> isClicked = [];

  List<int> counter = [];

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: newAppBar("Address", context),
      body: const AddressBody(),
    );
  }
}