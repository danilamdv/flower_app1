import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(70); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:      Colors.black12,
      toolbarHeight: 70.h,
      titleSpacing: 21.w,
      title: Text(
        "Profile",
        style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20.sp
        ),
      ),
      
    );
  }
}