import 'package:flutter/material.dart';

import '../constants.dart';

class GoBack extends StatelessWidget {
  const GoBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios_new,
            color: kIconBackColor, size: 16),
        onPressed: () => Navigator.of(context).pop());
  }
}
