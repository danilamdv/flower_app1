import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityCardSliverContent4 extends StatelessWidget {
  const CommunityCardSliverContent4({
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
          color: Color.fromARGB(255, 206, 215, 219),
        ),
        height: screenHeight * 0.5,
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
                        padding:  EdgeInsets.only(left: 10.r),
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
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sarah",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp),
                            ),
                            Text(
                              "June 11",
                              style: TextStyle(fontSize: 8.sp),
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
                              "post",
                              style: TextStyle(fontSize: 9.sp),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Padding(
                              padding:
                                   EdgeInsets.only(right: 10.r),
                              child: Icon(
                                CupertinoIcons.photo_on_rectangle,
                                size: 22.r,
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
              flex: 9,
              child: Padding(
                padding:  EdgeInsets.only(left: 15.r , right: 15.r),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/flower1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.r , top: 10.r , right: 16.r ),
                  child: Text(
                      "I needs Plant well i want to make the world is beaituful , can you help me ?" , style:  TextStyle( fontSize: 10.sp ),),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding:  EdgeInsets.only(left: 5.r),
                  child: Row(
                    children: [
                      TextButton.icon(
                          label: Text(
                            "43",
                            style: TextStyle(
                                fontSize: 9.sp, color: Colors.black),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            color: Colors.black,
                            CupertinoIcons.hand_thumbsup_fill,
                            size: 22.r,
                          )),
                      TextButton.icon(
                          label: Text(
                            "Reply",
                            style: TextStyle(
                                color: Colors.black, fontSize: 11.sp),
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
            ),
          ],
        ),
      ),
    );
  }
}