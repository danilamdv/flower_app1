import 'package:flower_app/appbar/home_screen_appbar.dart';
import 'package:flower_app/body_widgets/card_page/empty_card_page.dart';
import 'package:flower_app/body_widgets/catolog_page/catolog_page0.dart';
import 'package:flower_app/body_widgets/community_page/community_page0.dart';
import 'package:flower_app/body_widgets/home_screen_page/homescreen_page0.dart';
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
  late HomeScreenPage homescreen1;
  late ProfilePage profilePage5;
  late EmptyPage emptyPage3;
  late CommunityCard communityCard2;
  late CatologPage catologPage4;
  @override
  void initState() {
    homescreen1 = HomeScreenPage(pageController: PageController());
    profilePage5 = ProfilePage();
    emptyPage3 = EmptyPage();
    communityCard2 = CommunityCard();
    catologPage4 = CatologPage();
    AllPages = [homescreen1, communityCard2, emptyPage3, catologPage4 , profilePage5];
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
          appBar: _currentIndex == 0 ? CustomAppBar() : null,
          body: AllPages[_currentIndex],
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onNavBarTapped,
          ),
        ));
  }
}
