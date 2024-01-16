import 'package:flutter/material.dart';

import '../../constants.dart';
import 'accountBody.dart';



class Account extends StatefulWidget {
  const Account({
    Key? key,
  }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return   AccountBody();
  }
}


