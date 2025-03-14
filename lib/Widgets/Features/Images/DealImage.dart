import 'package:flutter/material.dart';

class DealImage extends StatelessWidget {
  const DealImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "https://images.unsplash.com/photo-1607936854279-55e8a4c64888?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80",
          height: 25,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: EdgeInsets.only(
            left: 15,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "\$100",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, top: 5, right: 40),
          child: Text("Hassan", maxLines: 2, overflow: TextOverflow.ellipsis),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1682685797527-63b4e495938f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                fit: BoxFit.fitHeight,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1682685797527-63b4e495938f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                fit: BoxFit.fitHeight,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1682685797527-63b4e495938f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                fit: BoxFit.fitHeight,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See All deals",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        ),
      ],
    );
  }
}
