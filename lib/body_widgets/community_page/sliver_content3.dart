import 'package:flower_app/models/questions_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CommunityCardSliverContent3 extends StatefulWidget {
  const CommunityCardSliverContent3({super.key});

  @override
  State<CommunityCardSliverContent3> createState() =>
      _CommunityCardSliverContent3State();
}

class _CommunityCardSliverContent3State
    extends State<CommunityCardSliverContent3> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuestionModel>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<QuestionModel>(
      builder: (context, questionModel, child) {
        if (questionModel.questions.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('No questions available'),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final question = questionModel.questions[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 206, 204, 204),
                  ),
                  height: screenHeight * 0.25,
                  width: screenWidth,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 35,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0.r),
                                  child: CircleAvatar(
                                    radius: 23.r,
                                    backgroundImage: NetworkImage(
                                        question.authorProfileImage),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      question
                                          .author, // Doğru kullanıcı adını gösterin
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    Text(
                                      "${question.date.month}/${question.date.day}",
                                      style: TextStyle(fontSize: 7.sp),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Question",
                                      style: TextStyle(fontSize: 9.sp),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.r, bottom: 5.h),
                                      child: Icon(
                                        CupertinoIcons.text_bubble,
                                        size: 20.r,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 40,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.r, right: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              question.text,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 25,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.r),
                              child: TextButton.icon(
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
                                ),
                              ),
                            ),
                            TextButton.icon(
                              label: Text(
                                "Reply",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10.sp),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                color: Colors.black,
                                CupertinoIcons.arrow_turn_up_left,
                                size: 22.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: questionModel.questions.length,
          ),
        );
      },
    );
  }
}
