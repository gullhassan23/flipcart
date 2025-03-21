import 'package:flutter/material.dart';

class AccountButtons extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  const AccountButtons({
    Key? key,
    required this.text,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(50),
            color: Colors.white),
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12.withOpacity(0.03),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: onpress,
            child: Text(
              text,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            )),
      ),
    );
  }
}
