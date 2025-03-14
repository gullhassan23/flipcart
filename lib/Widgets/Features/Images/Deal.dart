import 'package:flipcart/Widgets/Features/Images/DealImage.dart';
import 'package:flutter/material.dart';

class Deal extends StatelessWidget {
  const Deal({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, top: 25),
          child: Text(
            "Deal of the Day",
            style: TextStyle(fontSize: 20),
          ),
        ),

        // //  image
        DealImage(),
      ],
    );
  }
}
