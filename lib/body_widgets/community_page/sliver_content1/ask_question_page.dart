import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/body_widgets/community_page/community_page0.dart';
import 'package:flower_app/models/community_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AskQuestionPage extends StatefulWidget {
  const AskQuestionPage({Key? key}) : super(key: key);

  @override
  _AskQuestionPageState createState() => _AskQuestionPageState();
}

class _AskQuestionPageState extends State<AskQuestionPage> {
  final TextEditingController _controller = TextEditingController();
  String? _profileImageURL;
  String? _name;
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user.uid;
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('profiles')
          .doc(uid)
          .get();
      if (snapshot.exists) {
        setState(() {
          _profileImageURL = snapshot.data()?['profileImage'];
          _name = snapshot.data()?['name'];
          _username = snapshot.data()?['username'];
        });
      }
    }
  }

  Future<void> _askQuestion() async {
    final questionText = _controller.text;
    final communityPageModel =
        Provider.of<CommunityPageModel>(context, listen: false);

    if (_username != null &&
        _profileImageURL != null &&
        questionText.isNotEmpty) {
      await communityPageModel.createQuestion(
        _username!,
        questionText,
        _profileImageURL!,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CommunityCard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ask a Question",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.11,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundImage: _profileImageURL != null
                        ? NetworkImage(_profileImageURL!)
                        : AssetImage('assets/empty-profile.png')
                            as ImageProvider,
                    child: _profileImageURL == null
                        ? Icon(Icons.camera_alt, size: 40.r)
                        : null,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    _name ?? '',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.r),
                      child: IconButton(
                        iconSize: 22.r,
                        onPressed: () {},
                        icon: Transform.rotate(
                          angle: 1.7,
                          child: Icon(CupertinoIcons.tags),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 18.r),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 10.sp),
                hintText: 'Type your question here...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _askQuestion,
        child: Icon(Icons.send),
      ),
    );
  }
}
