import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(70); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      titleSpacing: 21.w,
      title: Text(
        "Discover",
        style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20.sp
        ),
      ),
      actions: [
        Container(
          height: 35.h,
          width: 35.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromARGB(255, 234, 237, 236),
                width: 2), 
          ),
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 24.r, 
          ),
        ),
        SizedBox(
          width: 19.w,
        ),
        Container(
          height: 35.h,
          width: 35.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromARGB(255, 234, 237, 236),
                width: 2), 
          ),
          child: Icon(
            Icons.favorite_border,
            color: Colors.black,
            size: 24.r, 
          ),
        ),
        SizedBox(
          width: 19.w,
        ),
      ],
    );
  }
}

