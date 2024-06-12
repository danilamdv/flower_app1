import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewIndicatorWidget extends StatelessWidget {
  final PageController controller;

  PageViewIndicatorWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.all(15.0.r),
            child: PageView(
              controller: controller,
              children: [
                Container(
                  child: Image.asset("assets/iyirmi.png", fit: BoxFit.fill),
                ),
                Container(
                  child: Image.asset("assets/iyirmi.png", fit: BoxFit.fill),
                ),
                Container(
                  child: Image.asset("assets/iyirmi.png", fit: BoxFit.fill),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: Color.fromARGB(255, 0, 118, 61),
                dotColor: Colors.black54,
                dotHeight: 7,
                dotWidth: 7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
