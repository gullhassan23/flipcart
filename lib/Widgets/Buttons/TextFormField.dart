import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final int lines;
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.obscureText,
    this.lines=1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 4),
      child: TextFormField(
        obscureText: obscureText,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38))),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "Enter yout $hintText";
          }
          return null;
        },
        maxLines: lines,
      ),
    );
  }
}
