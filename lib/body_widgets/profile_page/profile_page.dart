import 'package:flower_app/appbar/profile_page_appbar.dart';
import 'package:flower_app/body_widgets/profile_page/sliver_content1.dart';
import 'package:flower_app/body_widgets/profile_page/sliver_content2.dart';
import 'package:flower_app/body_widgets/profile_page/sliver_content3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: ProfilePageAppbar(),
        body: Container(
          padding: EdgeInsets.only(right: 18.r, left: 18.r,),
          color: Colors.black12,
          child: CustomScrollView(
            slivers: [
              ProfilePageSlivercontent1(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.h,
                ),
              ),
              ProfilePageSliverContent2(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.h,
                ),
              ),
              ProfilePageSliverContent3(),
            ],
          ),
        ));
  }
}

