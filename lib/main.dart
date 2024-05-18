import 'package:flower_app/appbar/custom_appbar.dart';
import 'package:flower_app/body_widgets/home_screen/sliver_content1.dart';
import 'package:flower_app/body_widgets/home_screen/sliver_content2.dart';
import 'package:flower_app/body_widgets/home_screen/sliver_content3.dart';
import 'package:flower_app/body_widgets/home_screen/slivergrid_content4.dart';
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
  final PageController _pageController = PageController();
  int _currentIndex = 0;
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
          appBar: CustomAppBar(),
          body: Container(
            padding: EdgeInsets.all(18),
            child: CustomScrollView(
              slivers: [
                SliverContent(
                  pageController: _pageController,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                SliverContent2(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverContent3(),
                CustomSliverGrid(),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onNavBarTapped,
          ),
        ));
  }
}
