import 'package:flower_app/body_widgets/community_page/sliver_content1/answer_page.dart';
import 'package:flower_app/body_widgets/community_page/sliver_content1/ask_question_page.dart';
import 'package:flower_app/body_widgets/community_page/sliver_content1/create_post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityPageSliverContent1 extends StatelessWidget {
  CommunityPageSliverContent1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.only(left: 15.r),
              alignment: Alignment.centerLeft,
              width: screenWidth * 0.9,
              height: screenHeight * 0.06,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0.w, color: Colors.grey),
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2.2),
                      color: Colors.grey.withOpacity(0.6),
                    )
                  ]),
              child: Text(
                "what do you want to ask or share?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.07,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AskQuestionPage(),
                            ));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.message_outlined,
                            size: 18.r,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "ask",
                            style: TextStyle(fontSize: 12.sp),
                          )
                        ],
                      )),
                ),
                Container(
                  height: screenHeight * 0.02,
                  width: 1.0.w,
                  color: Colors.grey,
                ),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnswerPage(
                                screenWidth: screenWidth,
                                screenHeight: screenHeight,
                              ),
                            ));
                      },
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.plus_bubble,
                            size: 18.r,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Answer",
                            style: TextStyle(fontSize: 12.0.sp),
                          )
                        ],
                      )),
                ),
                Container(
                  height: screenHeight * 0.02,
                  width: 1.0.w,
                  color: Colors.grey,
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreatePostPage(),
                            ));
                      },
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.photo_on_rectangle,
                            size: 18.0.r,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Post",
                            style: TextStyle(fontSize: 12.0.sp),
                          )
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
