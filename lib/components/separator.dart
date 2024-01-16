import 'package:flutter/material.dart';

import '../constants.dart';

class Separator extends StatelessWidget {
  const Separator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 0,
      color: kTextFieldColor,
      thickness: 2,
    );
  }
}
