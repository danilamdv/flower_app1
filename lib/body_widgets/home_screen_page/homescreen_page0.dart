import 'package:flower_app/body_widgets/home_screen_page/sliver_content1.dart';
import 'package:flower_app/body_widgets/home_screen_page/sliver_content2.dart';
import 'package:flower_app/body_widgets/home_screen_page/sliver_content3.dart';
import 'package:flower_app/body_widgets/home_screen_page/slivergrid_content4.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: CustomScrollView(
        slivers: [
          HomeScreenSliverContent(
            pageController: _pageController,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          HomeScreenSliverContent2(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          HomeScreenSliverContent3(),
          HomeScreenSliverGrid(),
        ],
      ),
    );
  }
}
