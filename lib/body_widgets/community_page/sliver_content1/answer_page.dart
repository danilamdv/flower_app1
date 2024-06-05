import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerPage extends StatelessWidget {
  final double screenWidth;

  final double screenHeight;

  const AnswerPage(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Answer questions',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Your replies',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: screenHeight * 0.055,
                          padding: EdgeInsets.only(left: 10.r),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 20.r,
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical:
                                              15.h), // Uyarlanabilir padding

                                      hintText: 'Search a question...',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 10.sp,
                                      )),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mic,
                                  color: Colors.grey,
                                  size: 20.r,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
                  child: Container(
                    height: screenHeight * 0.045,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.r),
                            child: Container(
                              width: 70.w,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                      foregroundColor: Colors.black,
                                      side: BorderSide(
                                          width: 1.r, color: Colors.grey)),
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
                            padding: EdgeInsets.only(right: 5.r),
                            child: Container(
                              width: 80.w,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                      foregroundColor: Colors.black,
                                      side: BorderSide(
                                          width: 1.r, color: Colors.grey)),
                                  onPressed: () {},
                                  child: Center(
                                    child: Text(
                                      "FAQS",
                                      style: TextStyle(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.r),
                            child: Container(
                              width: 130.w,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                      foregroundColor: Colors.black,
                                      side: BorderSide(
                                          width: 1.r, color: Colors.grey)),
                                  onPressed: () {},
                                  child: Center(
                                      child: Text("Gardening",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold)))),
                            ),
                          ),
                          Container(
                            width: 130.w,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    foregroundColor: Colors.black,
                                    side: BorderSide(
                                        width: 1.r, color: Colors.grey)),
                                onPressed: () {},
                                child: Center(
                                    child: Text("Plantcore",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold)))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              buildSliverToBoxAdapter(),
              buildSliverToBoxAdapter(),
              buildSliverToBoxAdapter(),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 206, 204, 204),
          ),
          height: screenHeight * 0.17,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 20.r, right: 10.r, top: 15.h),
                        child: Text(
                          "I needs Plant well i want to make the world is beaituful , can you help me ?",
                          style: TextStyle(
                              fontSize: 9.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.r, top: 5.h),
                        child: Text(
                          "24 answer",
                          style: TextStyle(fontSize: 9.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h, left: 5.r),
                  child: Container(
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
                              size: 21.r,
                            )),
                        TextButton.icon(
                            label: Text(
                              "Reply",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 9.sp),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              color: Colors.black,
                              CupertinoIcons.arrow_turn_up_left,
                              size: 21.r,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
