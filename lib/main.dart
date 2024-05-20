import 'package:flower_app/appbar/custom_appbar.dart';
import 'package:flower_app/body_widgets/home_screen/customscroolview0.dart';
import 'package:flower_app/body_widgets/profile_page/profile_page.dart';
import 'package:flower_app/bottomnavigatonbar/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  late List<Widget> AllPages;
  late scrollviewcontent homescreen1;
  late ProfilePage profilePage2;
  @override
  void initState() {
       homescreen1 = scrollviewcontent(pageController: PageController());
    profilePage2 = ProfilePage();
    AllPages = [homescreen1,homescreen1, homescreen1,homescreen1, profilePage2];
    super.initState();
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: _currentIndex==0 ?  CustomAppBar() : null,
          body: AllPages[_currentIndex],
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onNavBarTapped,
          ),
        ));
  }
}
