import 'package:flower_app/appbar/community_appbar.dart';
import 'package:flower_app/body_widgets/community_page/sliver_content1/sliver_content1.dart';
import 'package:flower_app/body_widgets/community_page/sliver_content2.dart';
import 'package:flower_app/body_widgets/community_page/sliver_content3.dart';
import 'package:flower_app/body_widgets/community_page/sliver_content4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CommunityAppbar(),
      body: Container(
        padding: EdgeInsets.only(
          right: 18,
          left: 18,
        ),
        child: CustomScrollView(
          slivers: [
            CommunityPageSliverContent1(screenWidth: screenWidth, screenHeight: screenHeight),
            SliverToBoxAdapter(
                child: Container(
              height: 1,
              color: Colors.grey,
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            CommunityCardSliverContent2(screenHeight: screenHeight),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            CommunityCardSliverontent3(screenHeight: screenHeight),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            CommunityCardSliverContent4(screenHeight: screenHeight)
          ],
        ),
      ),
    );
  }
}







