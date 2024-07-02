import 'package:flower_app/models/post_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CommunityCardSliverContent4 extends StatefulWidget {
  const CommunityCardSliverContent4({super.key});

  @override
  _CommunityCardSliverContent4State createState() =>
      _CommunityCardSliverContent4State();
}

class _CommunityCardSliverContent4State
    extends State<CommunityCardSliverContent4> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostModel>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<PostModel>(
      builder: (context, postModel, child) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = postModel.posts[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 206, 215, 219),
                  ),
                  height: screenHeight * 0.5,
                  width: screenWidth,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 20,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0.r),
                                  child: CircleAvatar(
                                    radius: 23.r,
                                    backgroundImage: NetworkImage(post
                                        .authorProfileImage), // Profil resmini güncelle
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
                                      post.author,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp),
                                    ),
                                    Text(
                                      "${post.date.month}/${post.date.day}",
                                      style: TextStyle(fontSize: 7.sp),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Post",
                                        style: TextStyle(fontSize: 9.sp),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.r),
                                        child: Icon(
                                          CupertinoIcons.photo_on_rectangle,
                                          size: 20.r,
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
                        flex: 58,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.r, right: 15.r),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: post.imageUrl != null
                                  ? Image.network(
                                      post.imageUrl!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/flower1.jpg",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.r, right: 16.r),
                            child: Text(
                              post.text,
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 14,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.r),
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
            },
            childCount: postModel.posts.length,
          ),
        );
      },
    );
  }
}
