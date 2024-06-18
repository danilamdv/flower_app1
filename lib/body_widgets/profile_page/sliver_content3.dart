import 'package:flower_app/body_widgets/profile_page/contactUs_page.dart';
import 'package:flower_app/login_page/welcome_screen.dart';
import 'package:flower_app/services/firebase_auth_services.dart';
import 'package:flower_app/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfilePageSliverContent3 extends StatefulWidget {
  const ProfilePageSliverContent3({
    super.key,
  });

  @override
  State<ProfilePageSliverContent3> createState() =>
      _ProfilePageSliverContent3State();
}

class _ProfilePageSliverContent3State extends State<ProfilePageSliverContent3> {
  Future getData() async {
    final sp = context.read<FirebaseAuthService>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<FirebaseAuthService>();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: Container(
          width: screenWidth * 1,
          height: screenHeight * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings',
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (WelcomeScreen())),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: ListTile(
                      leading: Icon(Icons.login),
                      title: Text('Login ',
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    sp.userSignOut();
                    nextScreenReplace(context, WelcomeScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log out ',
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold)),
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
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text('Support',
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold)),
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
