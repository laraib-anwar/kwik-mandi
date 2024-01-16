import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  const TextDisplay(
      {Key? key,
      required this.header,
      required this.color,
      required this.fs,
      required this.fw})
      : super(key: key);

  final String header;
  final Color color;
  final double? fs;
  final FontWeight? fw;

  @override
  Widget build(BuildContext context) {
    return Text(header,
        style: TextStyle(fontSize: fs, fontWeight: fw, color: color));
  }
}
