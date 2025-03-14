import 'package:flipcart/Widgets/Accounts/AccountScreenAppBar.dart';
import 'package:flipcart/Widgets/Features/Introduction.dart';
import 'package:flipcart/Widgets/Accounts/Orders.dart';
import 'package:flipcart/Widgets/Buttons/TopButton.dart';
import 'package:flipcart/constants/globalVariables.dart';

import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = GlobalVariables().getScreenSize();
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50), child: AccountScreenAppBar()),
          body: SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                children: [
                  Introduction(),
                  SizedBox(
                    height: 10,
                  ),
                  TopButton(),
                  SizedBox(
                    height: 20,
                  ),
                  Orders(),
                ],
              ))),
    );
  }
}
