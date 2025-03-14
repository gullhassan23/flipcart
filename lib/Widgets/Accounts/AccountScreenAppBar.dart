import 'package:flipcart/constants/globalVariables.dart';
import 'package:flutter/material.dart';

class AccountScreenAppBar extends StatefulWidget {
  @override
  State<AccountScreenAppBar> createState() => _AccountScreenAppBarState();
}

class _AccountScreenAppBarState extends State<AccountScreenAppBar> {
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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const SearchScreen()));
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
