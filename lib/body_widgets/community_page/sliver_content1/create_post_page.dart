import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/body_widgets/community_page/community_page0.dart';
import 'package:flower_app/models/community_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _controller = TextEditingController();
  File? _selectedImage;
  String? _profileImageURL;
  String? _name;
  String? _username;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
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
    } catch (e) {
      print("Kullanıcı profili yüklenirken hata oluştu: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profil bilgilerini yüklerken bir hata oluştu")),
      );
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _sharePost() async {
    if (_isLoading) return;
    if (_username == null || _profileImageURL == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profil bilgilerini yükleyemedi")),
      );
      return;
    }

    final text = _controller.text;
    final communityPageModel =
        Provider.of<CommunityPageModel>(context, listen: false);

    setState(() {
      _isLoading = true;
    });

    try {
      await communityPageModel.createPost(
        _username!,
        _profileImageURL!,
        text,
        _selectedImage,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CommunityCard(),
        ),
      );
    } catch (e) {
      print("Gönderi oluşturulurken hata oluştu: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gönderi oluşturulurken bir hata oluştu")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Post Oluştur"),
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
                  child: Container(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: _profileImageURL != null
                          ? NetworkImage(_profileImageURL!)
                          : AssetImage('assets/empty-profile.png')
                              as ImageProvider,
                      child: _profileImageURL == null
                          ? Icon(Icons.camera_alt, size: 40.r)
                          : null,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      _name ?? '',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          iconSize: 22.r,
                          onPressed: _pickImage,
                          icon: Icon(Icons.add_photo_alternate_outlined),
                        ),
                        IconButton(
                          iconSize: 22.r,
                          onPressed: () {},
                          icon: Transform.rotate(
                            angle: 1.7,
                            child: Icon(CupertinoIcons.tags),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
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
          _selectedImage != null
              ? Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.file(
                    _selectedImage!,
                    height: 150,
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _sharePost,
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Icon(Icons.send),
      ),
    );
  }
}
