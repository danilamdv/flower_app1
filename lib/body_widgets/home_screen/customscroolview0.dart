import 'package:flower_app/body_widgets/home_screen/sliver_content1.dart';
import 'package:flower_app/body_widgets/home_screen/sliver_content2.dart';
import 'package:flower_app/body_widgets/home_screen/sliver_content3.dart';
import 'package:flower_app/body_widgets/home_screen/slivergrid_content4.dart';
import 'package:flutter/material.dart';

class scrollviewcontent extends StatelessWidget {
  const scrollviewcontent({
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
          SliverContent(
            pageController: _pageController,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverContent2(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverContent3(),
          CustomSliverGrid(),
        ],
      ),
    );
  }
}
