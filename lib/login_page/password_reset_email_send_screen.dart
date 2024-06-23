import 'package:flower_app/login_page/login_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetEmailSentScreen extends StatelessWidget {
  final String email;

  PasswordResetEmailSentScreen({required this.email});

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
                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                  child: Container(
                    width: screenWidth,
                    height: 200.h,
                    child: Image.asset("assets/welcome3.jpg"),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 50.h,
                  child: Center(
                    child: Text(
                      "Password Reset Email Sent",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  child: Center(
                    child: Text(
                      email,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 100.h,
                  child: Center(
                    child: Text(
                      "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: screenWidth,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: screenWidth,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Resend Email',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
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
