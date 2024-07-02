import 'package:firebase_core/firebase_core.dart';
import 'package:flower_app/appbar/home_screen_appbar.dart';
import 'package:flower_app/body_widgets/card_page/empty_card_page.dart';
import 'package:flower_app/body_widgets/card_page/mycard_page0.dart';
import 'package:flower_app/body_widgets/catolog_page/catolog_page0.dart';
import 'package:flower_app/body_widgets/community_page/community_page0.dart';
import 'package:flower_app/body_widgets/home_screen_page/homescreen_page0.dart';
import 'package:flower_app/body_widgets/profile_page/profile_page.dart';
import 'package:flower_app/bottomnavigatonbar/custom_bottom_navbar.dart';
import 'package:flower_app/models/post_models.dart';
import 'package:flower_app/models/questions_models.dart';
import 'package:flower_app/services/firebase_auth_services.dart';
import 'package:flower_app/services/iternet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthService()),
        ChangeNotifierProvider(create: (_) => InternetProvider()),
        ChangeNotifierProvider(
          create: (_) => QuestionModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PostModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  late List<Widget> allPages;
  late HomeScreenPage homescreen1;
  late ProfilePage profilePage5;
  late EmptyPage emptyPage3;
  late CommunityCard communityCard2;
  late CatologPage catologPage4;
  late MyCartPage myCardPage3;

  @override
  void initState() {
    homescreen1 = HomeScreenPage(pageController: PageController());
    myCardPage3 = const MyCartPage();
    profilePage5 = const ProfilePage();
    emptyPage3 = const EmptyPage();
    communityCard2 = const CommunityCard();
    catologPage4 = const CatologPage();
    allPages = [
      homescreen1,
      communityCard2,
      myCardPage3,
      catologPage4,
      profilePage5
    ];
    super.initState();
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: _currentIndex == 0 ? CustomAppBar() : null,
          body: allPages[_currentIndex],
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onNavBarTapped,
          ),
        ),
      ),
    );
  }
}
