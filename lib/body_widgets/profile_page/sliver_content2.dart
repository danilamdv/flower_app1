import 'package:flower_app/body_widgets/profile_page/Privacy_policy.dart';
import 'package:flower_app/body_widgets/profile_page/calendar_page/calendar_page.dart';
import 'package:flower_app/body_widgets/profile_page/e_receipt/e_receipt0.dart';
import 'package:flower_app/body_widgets/profile_page/help_center_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfilePageSliverContent2 extends StatelessWidget {
  const ProfilePageSliverContent2({
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
          height: screenHeight * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Column(
            children: [
              Expanded(
                flex: 25,
                child: GestureDetector( 
                  onTap:  () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EReceiptPage() ,));
                  }, 
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: ListTile(
                      leading: Icon(Icons.shopping_bag_outlined),
                      title: Text('E-receipt',
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.navigate_next, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: GestureDetector(
                   onTap:  () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage() ,));
                  }, 
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: ListTile(
                      leading: Icon(Icons.monetization_on_outlined),
                      title: Text('Privacy Policy',
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.navigate_next, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: ListTile(
                    onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (CalendarPage0())),
                        );
                    },
                    leading: Icon(Icons.calendar_month_outlined),
                    title: Text('Calendar',
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.navigate_next, color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: GestureDetector(
                     onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (HelpCenterPage())),
                        );
                    },
                  child: Container(
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(Icons.subscriptions_outlined),
                      title: Text('Help Center',
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.navigate_next, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
