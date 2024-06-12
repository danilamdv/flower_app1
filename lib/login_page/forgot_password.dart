import 'package:flower_app/login_page/forgot_password_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool smsSelected = false;
  bool emailSelected = false;

  void onContactOptionSelected(bool isSmsSelected) {
    setState(() {
      if (isSmsSelected) {
        smsSelected = true;
        emailSelected = false;
      } else {
        smsSelected = false;
        emailSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            children: [
              Center(
                child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    child: Image.asset("assets/welcome3.jpg")),
              ),
              //  SizedBox(height: 20.h),
              Text(
                'Select which contact details should we use to reset your password',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              ContactOption(
                icon: Icons.sms,
                contactDetail: '+1 111 ******99',
                contactType: 'via SMS',
                onSelect: (isSelected) => onContactOptionSelected(true),
                isSelected: smsSelected,
              ),
              SizedBox(height: 10.h),
              ContactOption(
                icon: Icons.email,
                contactDetail: 'and***@gmail.com',
                contactType: 'via Email',
                onSelect: (isSelected) => onContactOptionSelected(false),
                isSelected: emailSelected,
              ),
              SizedBox(height: 20.h),
              Container(
                height: 50.h,
                width: screenWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordPin(),
                        ));
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 10.sp),
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

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String contactDetail;
  final String contactType;
  final Function(bool) onSelect;
  final bool isSelected;

  ContactOption({
    required this.icon,
    required this.contactDetail,
    required this.contactType,
    required this.onSelect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(true);
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.green : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contactType,
                    style: TextStyle(color: Colors.grey, fontSize: 10.sp)),
                Text(
                  contactDetail,
                  style: TextStyle(fontSize: 10.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
