import 'package:flower_app/payment_widget/paymen_successful_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage0 extends StatelessWidget {
  const PaymentPage0({super.key});

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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Payment Method ",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                  width: screenWidth * 1,
                  height: screenHeight * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Color(0xFFEAF3EF)),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.circle_outlined,
                              color: Colors.black,
                              size: 20.r,
                            ),
                            label: Text(
                              "PayPal",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 9.sp),
                            )),
                        Padding(
                          padding: EdgeInsets.all(4.0.r),
                          child: Container(
                              width: 200.w,
                              child: Text(
                                "you will to be redirected to the PayPal website other submitting your order",
                                style: TextStyle(
                                    fontSize: 7.sp, color: Colors.grey),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.r),
                          child: Container(
                            width: 25.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: EdgeInsets.all(2.0.r),
                              child: Image.asset(
                                "assets/paypal.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    width: screenWidth * 1,
                    height: screenHeight * 0.1,
                  ),
                ),
                Container(
                  height: screenHeight * 0.41,
                  decoration: BoxDecoration(
                      color: Color(0xFFEAF3EF),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.circle_outlined,
                                  color: Colors.black,
                                  size: 20.r,
                                ),
                                label: Text(
                                  "PayPal with Credit Card",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 9.sp),
                                )),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 15.r),
                              child: Container(
                                width: 25.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Image.asset(
                                  "assets/mastercard.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.r),
                              child: Container(
                                width: 25.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0.r),
                                  child: Image.asset(
                                    "assets/applepay.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.r),
                              child: Container(
                                width: 25.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: EdgeInsets.all(1.0.r),
                                  child: Image.asset(
                                    "assets/visa.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.r, top: 5.h, bottom: 5.h),
                        child: Text(
                          "Card number",
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.r, right: 10.r),
                        child: TextField(
                          cursorHeight: 0,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '1372 8273 8327 3823',
                              labelStyle: TextStyle(
                                  color: Colors.black, fontSize: 9.sp),
                              constraints: BoxConstraints(
                                maxWidth: screenWidth * 1,
                                maxHeight: screenHeight * 0.05,
                              ),
                              suffixIcon: Icon(
                                Icons.check_circle,
                                size: 20.r,
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.r, top: 15.h, bottom: 5.h),
                        child: Text(
                          "Card Security Code",
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.r, right: 10.r),
                        child: TextField(
                          cursorHeight: 0,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '1372 8273 8327 3823',
                              labelStyle: TextStyle(
                                  color: Colors.black, fontSize: 9.sp),
                              constraints: BoxConstraints(
                                maxWidth: screenWidth * 1,
                                maxHeight: screenHeight * 0.05,
                              ),
                              suffixIcon: Icon(
                                Icons.check_circle,
                                size: 20.r,
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.r, top: 15.h, bottom: 5.h),
                        child: Text(
                          "Zip/Postal Code",
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.r, right: 10.r),
                        child: TextField(
                          cursorHeight: 0,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '1372 8273 8327 3823',
                              labelStyle: TextStyle(
                                  color: Colors.black, fontSize: 9.sp),
                              constraints: BoxConstraints(
                                maxWidth: screenWidth * 1,
                                maxHeight: screenHeight * 0.05,
                              ),
                              suffixIcon: Icon(
                                Icons.check_circle,
                                size: 20.r,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 70.h),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: screenWidth * 1,
                    height: screenHeight * 0.06,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2.r, right: 7.r),
                          child: Container(
                            width: 25.0.w,
                            height: 25.0.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                )),
                            child: Icon(
                              Icons.lock,
                              size: 15.0.r,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "use product your payment information using encryption to provide bank-level security ",
                          style: TextStyle(color: Colors.grey, fontSize: 7.sp),
                        ))
                      ],
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
                            builder: (context) => PaymentSuccessfulPage1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6F8B7B),
                      textStyle: TextStyle(fontSize: 15.sp),
                    ),
                    child: Text(
                      'Confirm Order',
                      style: TextStyle(
                        color: Color(0xFFEAF3EF),
                      ),
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
