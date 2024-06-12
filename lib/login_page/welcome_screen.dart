import 'package:auth_buttons/auth_buttons.dart';
import 'package:flower_app/login_page/create_account.dart';
import 'package:flower_app/login_page/login_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 10.h,
          right: 10.r,
          left: 10.r,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: screenWidth,
                  height: 150.h,
                  child: Image.asset(
                    'assets/welcome1.png',
                    fit: BoxFit.contain,
                  )),
              //  SizedBox(height: 10.h),
              Text(
                "Let's you in",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              FacebookAuthButton(
                onPressed: () {},
                text: 'Continue with Facebook',
                style: AuthButtonStyle(
                    iconSize: 24.r,
                    iconType: AuthIconType.secondary,
                    iconBackground: Colors.white,
                    buttonColor: Colors.white,
                    textStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    width: screenWidth,
                    height: 45.h),
              ),
              SizedBox(height: 10.h),
              GoogleAuthButton(
                onPressed: () {},
                text: 'Continue with Google',
                style: AuthButtonStyle(
                    iconSize: 24.r,
                    iconType: AuthIconType.secondary,
                    iconBackground: Colors.white,
                    buttonColor: Colors.white,
                    textStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    width: screenWidth,
                    height: 45.h),
              ),
              SizedBox(height: 10.h),
              AppleAuthButton(
                onPressed: () {},
                text: 'Continue with Apple',
                style: AuthButtonStyle(
                    iconColor: Colors.black,
                    iconSize: 24.r,
                    iconType: AuthIconType.secondary,
                    iconBackground: Colors.white,
                    buttonColor: Colors.white,
                    textStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    width: screenWidth,
                    height: 45.h),
              ),
              SizedBox(height: 20.h),
              Text(
                'or',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(height: 20.h),
              Container(
                width: screenWidth,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Sign in with password',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: screenWidth,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountScreen(),
                        ));
                  },
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(fontSize: 9.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
