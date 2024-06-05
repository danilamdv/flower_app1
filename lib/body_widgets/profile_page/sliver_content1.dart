import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageSlivercontent1 extends StatelessWidget {
  const ProfilePageSlivercontent1({
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
          height: screenHeight * 0.18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white),
          child: Column(
            
            children: [
              Expanded(
                flex: 5,
                child: Container(
                    alignment: Alignment.center ,

                   decoration: BoxDecoration( border: Border( bottom:BorderSide( color: Colors.black12)  )  ),
                  child: ListTile(
                   // titleAlignment:ListTileTitleAlignment.center ,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/flower1.jpg"),
                      radius: 22.r,
                    ),
                    title: Text('Jony Coin' , style:  TextStyle( fontSize: 11.sp , fontWeight: FontWeight.bold ),),
                    subtitle: Text('Monthly home subscription', style:  TextStyle( fontSize: 9.sp ,color: Colors.grey) ) ,
                    trailing: Icon(Icons.navigate_next , color: Colors.grey,),
                  ),
                ),
              ),
               
              Expanded(
                flex: 5,
                child: Container(
                    alignment: Alignment.center ,

                  
                  child: ListTile(
                    leading: Icon(Icons.calendar_month , size: 45.r,),
                    title: Text('Mary s Brithay' ,style: TextStyle( fontSize: 11.sp , fontWeight: FontWeight.bold  ) ,),
                    subtitle: Text('Wants red roses' , style: TextStyle( fontSize: 9.sp , fontWeight: FontWeight.bold  )  ),
                    trailing: Icon(Icons.navigate_next , color: Colors.grey,),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
