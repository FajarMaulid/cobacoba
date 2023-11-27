import 'package:cashier/utils/color.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Text? text;
  final Widget? widget;

  const Header({super.key, this.text, this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 8,
        decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            (text != null)
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: text)
                : Container(),
            (widget != null)
                ? Positioned(
                    bottom: -25,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: widget),
                    ))
                : Container(),
          ],
        ));
  }
}
