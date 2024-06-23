import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/login_page/login_screen1.dart';
import 'package:flower_app/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String email;
  final String password;

  VerificationCodeScreen({required this.email, required this.password});

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  bool _isVerified = false;
  bool _checkingVerification = false;

  @override
  void initState() {
    super.initState();
    _checkEmailVerification();
  }

  void _checkEmailVerification() async {
    setState(() {
      _checkingVerification = true;
    });

    User? user =
        await _authService.createAccount(widget.email, widget.password);

    if (user != null) {
      user.reload();
      Timer.periodic(Duration(seconds: 3), (timer) async {
        user = FirebaseAuth.instance.currentUser;
        await user?.reload();
        if (user != null && user!.emailVerified) {
          timer.cancel();
          setState(() {
            _isVerified = true;
            _checkingVerification = false;
          });
          _navigateToLoginScreen();
        }
      });
    }
  }

  void _navigateToLoginScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void _next() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h, top: 100.h),
                  child: Container(
                    width: screenWidth,
                    height: 40.h,
                    child: Image.asset("assets/leafphoto.png"),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 100.h,
                  child: Center(
                    child: Text(
                      _isVerified
                          ? "confirmed!"
                          : "waiting for verification...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                if (_checkingVerification) CircularProgressIndicator(),
                if (!_isVerified)
                  Container(
                    width: screenWidth,
                    height: 200.h,
                    alignment: Alignment.center,
                    child: Text(
                      "A verification link has been sent to your email address to create an account. Once your account is approved, you will automatically switch to the login page. If you cannot switch automatically, please click the \"done\" button.",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                Container(
                  width: screenWidth,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _next,
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
