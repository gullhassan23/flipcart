import 'package:flipcart/constants/globalVariables.dart';
import 'package:flipcart/constants/utilss.dart';

import 'package:flutter/material.dart';

class CategoriesHorizontalListViewBar extends StatelessWidget {
  const CategoriesHorizontalListViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kAppBarHeight,
        width: double.infinity,
        // color: const Color.fromRGBO(255, 255, 255, 1),
        child: ListView.builder(
            itemCount: categoryLogos.length,
            scrollDirection: Axis.horizontal,
            itemExtent: 75,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print("click");
                },
                child: Column(
                  children: [
                    Container(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(categoryLogos[index],
                          fit: BoxFit.cover, height: 50, width: 50),
                    )),
                    Text(categoriesList[index]),
                  ],
                ),
              );
            }));
  }
}
