import 'package:flower_app/login_page/create_new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordPin extends StatefulWidget {
  @override
  _ForgotPasswordPinState createState() => _ForgotPasswordPinState();
}

class _ForgotPasswordPinState extends State<ForgotPasswordPin> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Code has been send to +99451****21',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: true,
              obscuringCharacter: '*',
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 40.h,
                fieldWidth: 50.w,
                activeFillColor: Colors.white,
                disabledColor: Colors.white,
                selectedFillColor: Colors.white,
                selectedColor: Colors.green,
                inactiveColor: Colors.transparent,
                inactiveFillColor: Colors.black12,
              ),
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                return true;
              },
            ),
            SizedBox(height: 20.h),
            Text(
              "resend code in 55 s",
              style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.h),
            Container(
              width: screenWidth,
              height: 40.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  print("PIN: $currentText");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateNewPasswordScreen(),
                      ));
                },
                child: Text(
                  'Verify',
                  style: TextStyle(fontSize: 10.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
