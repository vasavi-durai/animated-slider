import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Slider',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const ImageSlider(), // Home page with image slider
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
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Slider"),
      ),
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
                width: _currentIndex == index ? 200 : 150, // Adjust width for center image
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ColorFiltered(
                  colorFilter: _currentIndex == index
                      ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply) // Color center image
                      : const ColorFilter.mode(Color.fromARGB(255, 55, 50, 50), BlendMode.saturation), // B&W for others
                  child: Image.asset(
                    imgList[index], 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 500.0,
            autoPlay: true,
            enlargeCenterPage: true, 
            viewportFraction: 0.2, // Fraction of the screen taken by each image
            aspectRatio: 16/9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Update the current image index
              });
            },
          ),
        ),
      ),
    );
  }
}
