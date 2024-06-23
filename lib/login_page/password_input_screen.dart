import 'package:flower_app/login_page/verification_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordInputScreen extends StatefulWidget {
  final String email;

  PasswordInputScreen({required this.email});

  @override
  _PasswordInputScreenState createState() => _PasswordInputScreenState();
}

class _PasswordInputScreenState extends State<PasswordInputScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  Color _passwordIconColor = Colors.grey;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _goToVerificationCodeScreen() {
    String password = _passwordController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            VerificationCodeScreen(email: widget.email, password: password),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
                      "Şifrenizi Girin",
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
                        _passwordIconColor =
                            hasFocus ? Colors.green : Colors.grey;
                      });
                    },
                    child: TextField(
                      cursorHeight: 0,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: 'Şifre',
                        labelStyle: TextStyle(fontSize: 10.sp),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: _passwordIconColor, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _passwordIconColor,
                          size: 20.r,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            size: 20.r,
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: _passwordIconColor,
                          ),
                          onPressed: _togglePasswordVisibility,
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
                    onPressed: _goToVerificationCodeScreen,
                    child: Text(
                      'Devam et',
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
