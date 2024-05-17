import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliverContent extends StatelessWidget {
  final PageController pageController;

  const SliverContent({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: 100,
        height: 200,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "assets/flower1.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                     
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "assets/flower3.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                     
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "assets/flower1.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    
                   
                    
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                ),
              ),
            ),
          ],
        ),
      ),
      ) ;
  }
}
