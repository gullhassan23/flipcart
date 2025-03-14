import 'package:flipcart/Widgets/Features/Images/Deal.dart';
import 'package:flipcart/Widgets/Features/Categories.dart';
import 'package:flipcart/Widgets/Accounts/Userbanner.dart';

import 'package:flipcart/Widgets/Features/Images/coursalImages.dart';
import 'package:flipcart/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/Bars/SearchBar.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double offset = 0;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: SearchBarWidget(
              isReadOnly: false,
              hasBackButton: false,
            )),
        body: SingleChildScrollView(
            child: Column(
          children: [
            UserDetailsBar(offset: offset),
            SizedBox(
              height: 4,
            ),
            CategoriesHorizontalListViewBar(),
            CoursalImagesAdBanner(),
            SizedBox(
              height: 4,
            ),
            Deal(),
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            Text(user.name)
          ],
        )),
      ),
    );
  }
}
