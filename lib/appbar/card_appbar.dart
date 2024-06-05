import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 70.h,
        titleSpacing: 21.w,
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20.sp),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 20.r),
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: const Color.fromARGB(255, 234, 237, 236), width: 2),
              ),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 24.r,
              ),
            ),
          ),
        ]);
  }
}
