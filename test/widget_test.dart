import 'package:flower_app/models/post_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                padding: EdgeInsets.only(bottom: 10),
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
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: CircleAvatar(
                                    radius: 23,
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
                                          fontSize: 10),
                                    ),
                                    Text(
                                      "${post.date.month}/${post.date.day}",
                                      style: TextStyle(fontSize: 7),
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
                                        style: TextStyle(fontSize: 9),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          CupertinoIcons.photo_on_rectangle,
                                          size: 20,
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
                          padding: EdgeInsets.only(left: 15, right: 15),
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
                                      height: 170,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 30,
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "170 Ziyaretçi",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "58 Yorum",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Paylaş",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    CupertinoIcons.arrowshape_turn_up_right,
                                    size: 15,
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  post.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
