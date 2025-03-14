import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipcart/constants/globalVariables.dart';
import 'package:flutter/material.dart';

class CoursalImagesAdBanner extends StatelessWidget {
  const CoursalImagesAdBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              i,
              fit: BoxFit.cover,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}