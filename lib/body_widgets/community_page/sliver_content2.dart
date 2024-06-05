import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityCardSliverContent2 extends StatelessWidget {
  const CommunityCardSliverContent2({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: screenHeight * 0.04,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(right: 5.r),
                child: Container(
                  width: 70.0.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          foregroundColor: Colors.black,
                          side: BorderSide(width: 1, color: Colors.grey)),
                      onPressed: () {},
                      child: Center(
                        child: Text("all",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold)),
                      )),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 5.r),
                child: Container(
                  width: 80.0.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          foregroundColor: Colors.black,
                          side: BorderSide(width: 1, color: Colors.grey)),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "FAQS",
                          style: TextStyle(
                              fontSize: 9.sp, fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      )),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 5.r),
                child: Container(
                  width: 120.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          foregroundColor: Colors.black,
                          side: BorderSide(width: 1, color: Colors.grey)),
                      onPressed: () {},
                      child: Text("Gardening",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold))),
                ),
              ),
              Container(
                width: 120.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        foregroundColor: Colors.black,
                        side: BorderSide(width: 1, color: Colors.grey)),
                    onPressed: () {},
                    child: Text("Plantcore",
                    textAlign: TextAlign.center,
                        style: TextStyle(
                          
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
