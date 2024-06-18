import 'dart:async';

import 'package:flower_app/body_widgets/profile_page/profile_page.dart';
import 'package:flower_app/login_page/welcome_screen.dart';
import 'package:flower_app/services/firebase_auth_services.dart';
import 'package:flower_app/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<FirebaseAuthService>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, WelcomeScreen())
          : nextScreen(context, const ProfilePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Image(
          image: AssetImage("assets/profilphoto.jpg"),
          height: 80,
          width: 80,
        )),
      ),
    );
  }
}
