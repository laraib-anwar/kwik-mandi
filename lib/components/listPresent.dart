import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwik_mandi/components/customTab.dart';
import 'package:kwik_mandi/components/gap.dart';

import '../constants.dart';

class ListPresent extends StatelessWidget {
  final bool? add;
  const ListPresent(
      {Key? key,
      required this.list,
      required this.wd,
      required this.hg,
      this.add})
      : super(key: key);

  final list;
  final double wd;
  final double hg;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return add != true
            ? Row(
                children: [
                  Image.asset(
                    list[index],
                    width: wd,
                    height: hg,
                  ),
                  const SizedBox(width: 8)
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        list[index],
                        width: wd,
                        height: hg,
                      ),
                      const SizedBox(width: 8)
                    ],
                  ),
                  const Gap(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('\u{20B9}325'),
                     CustomTab(header: 'Add', wd: 101,)
                    ],
                  ),
                ],
              );
      },
    );
  }
}
