import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/models/community_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommunityCardSliverContent extends StatefulWidget {
  const CommunityCardSliverContent({Key? key}) : super(key: key);

  @override
  _CommunityCardSliverContentState createState() =>
      _CommunityCardSliverContentState();
}

class _CommunityCardSliverContentState
    extends State<CommunityCardSliverContent> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<CommunityPageModel>(context, listen: false).fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<CommunityPageModel>(
      builder: (context, communityPageModel, child) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = communityPageModel.items[index];
              final currentUserId = FirebaseAuth.instance.currentUser?.uid;

              return Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 206, 215, 219),
                    ),
                    height:
                        item is Post ? screenHeight * 0.5 : screenHeight * 0.25,
                    width: screenWidth,
                    child: Column(
                      children: [
                        Expanded(
                          flex: item is Post ? 20 : 35,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0.r),
                                    child: CircleAvatar(
                                      radius: 23.r,
                                      backgroundImage:
                                          NetworkImage(item.authorProfileImage),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.author,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp),
                                      ),
                                      Text(
                                        "${item.date.month}/${item.date.day}",
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
                                          item is Post ? "Post" : "Question",
                                          style: TextStyle(fontSize: 9.sp),
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.r),
                                          child: item is Post
                                              ? Icon(
                                                  CupertinoIcons
                                                      .photo_on_rectangle,
                                                  size: 20.r,
                                                )
                                              : Icon(
                                                  CupertinoIcons.text_bubble,
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
                        if (item is Post && item.imageUrl != null)
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
                                  child: Image.network(
                                    item.imageUrl!,
                                    fit: BoxFit.cover,
                                    height: 170.h,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          flex: item is Post ? 8 : 40,
                          child: Container(
                            alignment: item is Post
                                ? Alignment.bottomLeft
                                : Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.r, right: 16.r),
                              child: Text(
                                item.text,
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: item is Post ? 14 : 25,
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
                                    ),
                                  ),
                                  TextButton.icon(
                                    label: Text(
                                      "Reply",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 11.sp),
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            CommentBottomSheet(
                                          itemId: item.id,
                                          isPost: item is Post,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      color: Colors.black,
                                      CupertinoIcons.arrow_turn_up_left,
                                      size: 22.r,
                                    ),
                                  ),
                                  Spacer(),
                                  PopupMenuButton<String>(
                                    onSelected: (String value) {
                                      if (value == 'Delete') {
                                        _showDeleteDialog(item);
                                      } else if (value == 'Report') {
                                        // Report işlemi burada yapılacak
                                      }
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        if (item.userId == currentUserId)
                                          PopupMenuItem<String>(
                                            value: 'Delete',
                                            child: Text('Delete'),
                                          ),
                                        PopupMenuItem<String>(
                                          value: 'Report',
                                          child: Text('Report'),
                                        ),
                                      ];
                                    },
                                    icon: Icon(Icons.more_horiz),
                                  ),
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
            },
            childCount: communityPageModel.items.length,
          ),
        );
      },
    );
  }

  void _showDeleteDialog(CommunityItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Confirmation'),
        content: Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _deleteItem(item);
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _deleteItem(CommunityItem item) {
    final communityPageModel =
        Provider.of<CommunityPageModel>(context, listen: false);
    if (item is Post) {
      communityPageModel.deletePost(item.id);
    } else if (item is Question) {
      communityPageModel.deleteQuestion(item.id);
    }
  }
}

class CommentBottomSheet extends StatefulWidget {
  final String itemId;
  final bool isPost;

  const CommentBottomSheet({
    Key? key,
    required this.itemId,
    required this.isPost,
  }) : super(key: key);

  @override
  _CommentBottomSheetState createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  late Future<List<Map<String, dynamic>>> _commentsFuture;
  String? _currentUserId;

  @override
  void initState() {
    super.initState();
    _commentsFuture = fetchComments();
    _currentUserId = FirebaseAuth.instance.currentUser?.uid;
  }

  Future<List<Map<String, dynamic>>> fetchComments() {
    return Provider.of<CommunityPageModel>(context, listen: false)
        .fetchComments(widget.itemId, widget.isPost);
  }

  void _addComment() async {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      await Provider.of<CommunityPageModel>(context, listen: false)
          .addComment(widget.itemId, text, widget.isPost);
      _commentController.clear();
      setState(() {
        _commentsFuture = fetchComments();
      });
    }
  }

  void _deleteComment(String commentId) async {
    try {
      await Provider.of<CommunityPageModel>(context, listen: false)
          .deleteComment(widget.itemId, commentId, widget.isPost);
      setState(() {
        _commentsFuture = fetchComments();
      });
    } catch (e) {
      print("Comment deletion error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _commentsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No comments found"));
        } else {
          final comments = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return ListTile(
                      title: Text(comment['text']),
                      subtitle: Text(timeago.format(comment['date'].toDate())),
                      trailing: comment['uid'] == _currentUserId
                          ? IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _deleteComment(
                                comment['commentId'],
                              ),
                            )
                          : null,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _addComment,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
