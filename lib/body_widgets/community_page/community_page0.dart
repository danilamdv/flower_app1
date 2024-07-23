import 'package:flower_app/appbar/community_appbar.dart';
import 'package:flower_app/body_widgets/community_page/community_card_sliver_content.dart';
import 'package:flower_app/body_widgets/community_page/sliver_content1.dart';
import 'package:flower_app/body_widgets/community_page/sliver_content2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommunityAppbar(),
      body: Container(
        padding: EdgeInsets.only(
          right: 15.0.r,
          left: 15.0.r,
        ),
        child: CustomScrollView(
          slivers: [
            CommunityPageSliverContent1(),
            SliverToBoxAdapter(
                child: Container(
              height: 1.0.h,
              color: Colors.grey,
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.0.h,
              ),
            ),
            CommunityCardSliverContent2(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.0.h,
              ),
            ),
            CommunityCardSliverContent(),
          ],
        ),
      ),
    );
  }
}
