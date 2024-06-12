import 'package:flower_app/body_widgets/home_screen_page/homescreen_page0.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessfulPage1 extends StatelessWidget {
  const PaymentSuccessfulPage1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            'Payment',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: 200.r),
                child: Container(
                  width: screenWidth*1 ,
                  height: screenHeight * 0.5,
                  child: Lottie.asset(
                    'assets/successful.json',
                  ),
                ),
              ),
              Container(
                height: 45.h,
                width: screenWidth * 1,
                child: ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeScreenPage(pageController: PageController())),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6F8B7B),
                    textStyle: TextStyle(fontSize: 14.sp),
                  ),
                  child: Text(
                    'Return to homepage',
                    style: TextStyle(
                      color: Color(0xFFEAF3EF),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
