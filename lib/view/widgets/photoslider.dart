import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class sliderpic extends StatelessWidget {
  final List<String> images = [
    'assets/images/3mk.jpg',
    'assets/images/hhh.jpg',
    'assets/images/saitama.jpg',
  ];

  sliderpic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
          ),
          items: images.map((image) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(image, fit: BoxFit.cover, width: 350),
            );
          }).toList(),
        ),
      ),
    );
  }
}
