import 'package:badges/badges.dart' as badges;
import 'package:flipcart/Screens/AccountScreen.dart';
import 'package:flipcart/constants/globalVariables.dart';

import 'package:flutter/material.dart';

import '../../Screens/HomeScreen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 32;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    Home(),
    Account(),
    Center(
      child: Text("Cart Page"),
    )
  ];
  void updatePage(int Page) {
    setState(() {
      _page = Page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth))),
              child: Icon(Icons.home_outlined),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth))),
              child: Icon(Icons.person_outline_outlined),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: badges.Badge(
                    badgeAnimation: badges.BadgeAnimation.rotation(
                        curve: Curves.bounceInOut),
                    showBadge: true,
                    badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                    badgeContent: Text("2"),
                    child: Icon(Icons.shopping_bag_outlined)),
              ),
              label: "")
        ],
      ),
    );
  }
}
