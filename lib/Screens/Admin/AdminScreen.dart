import 'package:flipcart/Screens/Admin/PostScreen.dart';
import 'package:flipcart/Widgets/Bars/AdminBar.dart';
import 'package:flipcart/constants/globalVariables.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int _page = 0;
  double bottomBarWidth = 32;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    PostScreen(),
    Center(
      child: Text("Analytics Page"),
    ),
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
    return SafeArea(
        child: Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60), child: AdminBar(textt: "Admin",)),
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
              child: Icon(Icons.analytics_outlined),
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
              child: Icon(Icons.all_inbox_outlined),
            ),
            label: "",
          ),
        ],
      ),
    ));
  }
}
