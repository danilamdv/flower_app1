import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ask a question",
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
                  child: Container(
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundImage: AssetImage("assets/profilphoto.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      'Rohan B',
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
                            onPressed: () {},
                            icon: Icon(Icons.add_photo_alternate_outlined)),
                        IconButton(
                            iconSize: 22.r,
                            onPressed: () {},
                            icon: Transform.rotate(
                                angle: 1.7, child: Icon(CupertinoIcons.tags))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1.h,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.r),
            child: TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 10.sp),
                  hintText: 'Say something...',
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: screenHeight * 0.055,
        width: screenWidth * 0.23,
        child: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          label: Text(
            "Ask",
            style: TextStyle(color: Colors.white70 , fontSize: 10.sp),
          ),
          backgroundColor: const Color.fromARGB(170, 0, 106, 98),
          onPressed: () {},
        ),
      ),
    );
  }
}
