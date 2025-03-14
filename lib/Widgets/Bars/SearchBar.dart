import 'package:flipcart/constants/globalVariables.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  const SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = GlobalVariables().getScreenSize();
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.hasBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
              : Container(),
          SizedBox(
            width: screenSize.width * 0.7,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                onSubmitted: (String query) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ResultsScreen(query: query),
                  //   ),
                  // );
                },
                readOnly: widget.isReadOnly,
                onTap: () {
                  // if (widget.isReadOnly) {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const SearchScreen()));
                  // }
                },
                decoration: InputDecoration(
                  hintText: "Search for something in amazon",
                  fillColor: Colors.white,
                  filled: true,
                  border: border,
                  focusedBorder: border,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_none_outlined),
          )
        ],
      ),
    );
  }
}
