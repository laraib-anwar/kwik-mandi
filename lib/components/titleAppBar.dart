import 'package:flutter/material.dart';
import 'package:kwik_mandi/components/textDisplay.dart';

import '../constants.dart';
import 'goBack.dart';


class TitleAppBar extends StatelessWidget {
  final String title;
  const TitleAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const GoBack(),
        TextDisplay(header: title, color: kGrey1, fs: 18, fw: FontWeight.w600)
      ],
    );
  }
}
