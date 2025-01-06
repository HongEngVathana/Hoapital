import 'dart:async';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;

  const ImageSlider({
    Key? key,
    required this.currentSlide,
    required this.onChange,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late final PageController _pageController;
  late Timer _timer;
  final int _numSlides = 3; // Update to match the number of images

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentSlide);

    // Set up a timer to auto-scroll every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
      if (nextPage >= _numSlides) {
        nextPage = 0; // Loop back to the first slide
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      widget.onChange(nextPage); // Update the currentSlide in parent widget
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Stop the timer when the widget is disposed
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: widget.onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset("lib/assets/images/banner1.jpg", fit: BoxFit.cover),
                Image.asset("lib/assets/images/banner2.jpg", fit: BoxFit.cover),
                Image.asset("lib/assets/images/banner3.jpg", fit: BoxFit.cover),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _numSlides,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: widget.currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.currentSlide == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
