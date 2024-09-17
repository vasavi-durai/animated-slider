
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MysliderApp());
}

class MysliderApp extends StatelessWidget {
  const MysliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ImageSlider(), 
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  final List<String> imgList = [
       'assets/images/bridal-ad-banner.jpg' ,
       'assets/images/hair-cut-ad-banner.jpg',
       'assets/images/product-ad-banner.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index, realIdx) {
            return GestureDetector(
              onTap: () {
                // Handle image tap here
                // ignore: avoid_print
                print("Tapped on image $index");
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ColorFiltered(
                  colorFilter: _currentIndex == index
                      ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply) 
                      : const ColorFilter.mode(Color.fromARGB(255, 28, 28, 28), BlendMode.saturation),
                  child: Image.asset(
                    imgList[index], 
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            enlargeCenterPage:  false,
            viewportFraction: 0.8, 
            aspectRatio: 16/9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; 
              });
            },
          ),
        ),
      ),
    );
  }
}
