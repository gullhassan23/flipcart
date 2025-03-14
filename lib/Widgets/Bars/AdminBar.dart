import 'package:flutter/material.dart';

import 'package:flipcart/constants/globalVariables.dart';

class AdminBar extends StatefulWidget {
final String textt;

  const AdminBar({super.key, required this.textt});
  @override
  State<AdminBar> createState() => _AdminBarState();
}

class _AdminBarState extends State<AdminBar> {
  @override
  @override
  Widget build(BuildContext context) {
    Size screenSize = GlobalVariables().getScreenSize();

    return Container(
      height: kAppBarHeight,
      width: screenSize.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/images/amazon.png",
                      height: 45,
                      width: 100,
                    ),
                  )
                ],
              )),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 19),
                child: Text(
                  widget.textt,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
