import 'package:flower_app/body_widgets/profile_page/contactUs_page.dart';
import 'package:flower_app/login_page/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageSliverContent3 extends StatelessWidget {
  const ProfilePageSliverContent3({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                child: GestureDetector(
                  onTap:  () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (WelcomeScreen())),
                        );
                  }, 
                  child: Container(
                    alignment: Alignment.center ,
                  
                     decoration: BoxDecoration( border: Border( bottom:BorderSide( color: Colors.black12)  )  ),
                    child: ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text('Login ' ,  style: TextStyle( fontSize: 11.sp , fontWeight: FontWeight.bold  ) ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
              ),
             
              Expanded(
                child: GestureDetector( 
                  onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (ContactUsPage())),
                        );
                  }, 
                  child: Container(
                    alignment: Alignment.center ,
                  
                   
                    child: ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text('Support' ,  style: TextStyle( fontSize: 11.sp , fontWeight: FontWeight.bold  ) ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

