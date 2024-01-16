import 'package:flutter/material.dart';
import 'package:kwik_mandi/components/textDisplay.dart';

import '../constants.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({Key? key, required this.header, this.add, required this.wd})
      : super(key: key);
  final String header;
  final bool? add;
  final double wd;
  //final VoidCallbackFunction;

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all((12)),
      padding: EdgeInsets.symmetric(
        horizontal: (widget.add != true ? 30 : 10),
        vertical: (10),
      ),
      width: widget.wd,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kTextFieldColor)),
      child: widget.add != true
          ? Text(widget.header, style: const TextStyle(color: kPrimaryColor))
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                GestureDetector(
                  onTap:() {
                    setState(() {
                      
                    });
                  },
                  child:const TextDisplay(
                      header: '+',
                      color: kPrimaryColor,
                      fs: 14,
                      fw: FontWeight.w300),
                ),
               const SizedBox(width: 2),
               const TextDisplay(
                    header: '0',
                    color: kPrimaryColor,
                    fs: 14,
                    fw: FontWeight.w300),
                const SizedBox(width: 2),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      
                    });

                  },
                  child: const TextDisplay(
                      header: '-',
                      color: kPrimaryColor,
                      fs: 14,
                      fw: FontWeight.w300),
                ),
              ],
            ),
    );
  }
}
