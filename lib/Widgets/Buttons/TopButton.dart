import 'package:flipcart/Widgets/Accounts/AccountButton.dart';
import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButtons(text: "Your Orders", onpress: () {}),
            AccountButtons(text: "Turn Seller", onpress: () {}),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButtons(text: "Logout", onpress: () {}),
            AccountButtons(text: "Your WishList", onpress: () {}),
          ],
        ),
      ],
    );
  }
}
