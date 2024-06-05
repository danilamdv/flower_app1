import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageSliverContent3 extends StatelessWidget {
  const ProfilePageSliverContent3({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          width: screenWidth * 1,
          height: screenHeight * 0.26,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center ,

                   decoration: BoxDecoration( border: Border( bottom:BorderSide( color: Colors.black12)  )  ),
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings' ,  style: TextStyle( fontSize: 11.sp , fontWeight: FontWeight.bold  )  ),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ),
              
              Expanded(
                child: Container(
                  alignment: Alignment.center ,

                   decoration: BoxDecoration( border: Border( bottom:BorderSide( color: Colors.black12)  )  ),
                  child: ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    title: Text('Adresses' ,  style: TextStyle( fontSize: 11.sp , fontWeight: FontWeight.bold  ) ),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ),
             
              Expanded(
                child: Container(
                  alignment: Alignment.center ,

                 
                  child: ListTile(
                    leading: Icon(Icons.support_agent),
                    title: Text('Support' ,  style: TextStyle( fontSize: 11.sp , fontWeight: FontWeight.bold  ) ),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

