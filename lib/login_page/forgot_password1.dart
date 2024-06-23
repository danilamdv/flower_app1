import 'package:flower_app/login_page/password_reset_email_send_screen.dart';
import 'package:flower_app/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EmailInputScreenForgotPassword extends StatefulWidget {
  @override
  _EmailInputScreenForgotPasswordState createState() =>
      _EmailInputScreenForgotPasswordState();
}

class _EmailInputScreenForgotPasswordState
    extends State<EmailInputScreenForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  Color _emailIconColor = Colors.grey;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendPasswordResetEmail() async {
    final email = _emailController.text.trim();
    if (email.isNotEmpty) {
      try {
        await Provider.of<FirebaseAuthService>(context, listen: false)
            .resetPassword(email);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasswordResetEmailSentScreen(email: email),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Şifre sıfırlama e-postası gönderilemedi: $e")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lütfen geçerli bir e-posta adresi girin.")),
      );
    }
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
                  padding: EdgeInsets.only(bottom: 10.h, top: 50.h),
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
                      "Email Adresinizi Girin",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.h,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        _emailIconColor = hasFocus ? Colors.green : Colors.grey;
                      });
                    },
                    child: TextField(
                      cursorHeight: 0,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 10.sp),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: _emailIconColor, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: _emailIconColor,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: screenWidth,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _sendPasswordResetEmail,
                    child: Text(
                      'Continue',
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
