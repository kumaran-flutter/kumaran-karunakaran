import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kumaran_k_portfolio/utils/common_utils.dart';
import 'package:kumaran_k_portfolio/styles/styles.dart';

class CarouselComponent extends StatelessWidget {
  const CarouselComponent({super.key});
  static const List<String> icons = [
    AppIcons.icons8AppStore,
    AppIcons.icons8PlayStore,
    AppIcons.icons8Figma,
    AppIcons.icons8Firebase,
    AppIcons.icons8Flutter,
    AppIcons.icons8Dart,
    AppIcons.icons8Javascript,
    AppIcons.icons8Nodejs,
    AppIcons.icons8ExpressJs,
    AppIcons.icons8Git,
    AppIcons.icons8Github,
    AppIcons.icons8Gmail,
    AppIcons.icons8Jira,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider(
        items: icons.map((icon) {
          return Builder(
            builder: (BuildContext context) {
              return CommonUtils.getSvgIcon(icon, size: 36);
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 80,
          autoPlay: true,
          autoPlayCurve: Curves.linear, // Use linear for smooth constant speed
          autoPlayInterval: const Duration(
            milliseconds: 3000,
          ), // Adjusted for smoother transitions
          autoPlayAnimationDuration: const Duration(
            milliseconds: 3000,
          ), // longer animation
          scrollDirection: Axis.horizontal,
          pauseAutoPlayOnTouch: false,
          viewportFraction: 114 / MediaQuery.of(context).size.width,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          pageSnapping: false,
          scrollPhysics:
              const BouncingScrollPhysics(), // Use BouncingScrollPhysics for smooth scrolling
        ),
      ),
    );
  }
}
