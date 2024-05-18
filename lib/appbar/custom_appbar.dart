import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(70); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      titleSpacing: 21,
      title: Text(
        "Discover",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromARGB(255, 234, 237, 236),
                width: 2), 
          ),
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 24, 
          ),
        ),
        SizedBox(
          width: 19,
        ),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromARGB(255, 234, 237, 236),
                width: 2), 
          ),
          child: Icon(
            Icons.favorite_border,
            color: Colors.black,
            size: 24, 
          ),
        ),
        SizedBox(
          width: 19,
        ),
      ],
    );
  }
}

