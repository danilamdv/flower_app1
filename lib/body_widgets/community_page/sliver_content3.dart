import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityCardSliverontent3 extends StatelessWidget {
  const CommunityCardSliverontent3({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 206, 204, 204),
        ),
        height: screenHeight * 0.25,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 10.0.r),
                        child: Container(
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundImage: AssetImage(
                              "assets/profilphoto.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sarah",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                            Text(
                              "June 11",
                              style: TextStyle(fontSize: 9.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Question",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right: 10.r),
                              child: Icon(
                                CupertinoIcons.text_bubble,
                                size: 21.r,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding:  EdgeInsets.only(left: 15.r , right: 10),
                  child: Text(
                    textAlign: TextAlign.start ,
                      "I needs Plant well i want to make the world is beaituful , can you help me ?" , style:  TextStyle(fontSize: 10.sp ),),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 5.r),
                      child: TextButton.icon(
                          label: Text(
                            "43",
                            style: TextStyle(fontSize: 9.sp, color: Colors.black),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            color: Colors.black,
                            CupertinoIcons.hand_thumbsup_fill,
                            size: 22.r,
                          )),
                    ),
                    TextButton.icon(
                        label: Text(
                          "Reply",
                          style: TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          color: Colors.black,
                          CupertinoIcons.arrow_turn_up_left,
                          size: 22.r,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
