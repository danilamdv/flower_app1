import 'package:auth_buttons/auth_buttons.dart';
import 'package:flower_app/login_page/create_pin.dart';
import 'package:flower_app/login_page/login_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  Color _emailIconColor = Colors.grey;
  Color _passwordIconColor = Colors.grey;
  bool _isChecked = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    print('Email: $email, Password: $password');

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PinCodeVerificationScreen(),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;

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
                  padding: EdgeInsets.only(bottom: 10.h),
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
                      "Create Your Account",
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
                SizedBox(height: 10.h),
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
                            borderSide:
                                BorderSide(color: _emailIconColor, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: _passwordIconColor, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 10.sp),
                        prefixIcon: Icon(Icons.lock,
                            color: _passwordIconColor, size: 20.r),
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
                  height: 20.h,
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            checkboxTheme: CheckboxThemeData(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.white;
                              }),
                            ),
                          ),
                          child: Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              fontSize: 10.0.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: screenWidth,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              
                Container(
                  width: screenWidth,
                  height: 120.h,
                  child: Center(
                    child: Text(
                      "or continue with",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 35.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleAuthButton(
                        onPressed: () {},
                        style: AuthButtonStyle(
                          borderColor: Colors.black12,
                          borderWidth: 1,
                          iconSize: 20.r,
                          buttonColor: Colors.white,
                          buttonType: AuthButtonType.icon,
                        ),
                      ),
                      FacebookAuthButton(
                        onPressed: () {},
                        style: AuthButtonStyle(
                          borderColor: Colors.black12,
                          borderWidth: 1,
                          iconSize: 20.r,
                          buttonColor: Colors.white,
                          iconColor: Colors.blue,
                          buttonType: AuthButtonType.icon,
                        ),
                      ),
                      AppleAuthButton(
                        onPressed: () {},
                        style: AuthButtonStyle(
                          borderColor: Colors.black12,
                          borderWidth: 1,
                          iconSize: 20.r,
                          buttonColor: Colors.white,
                          iconColor: Colors.black,
                          buttonType: AuthButtonType.icon,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0.r),
                  child: Container(
                    width: screenWidth,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Already have on account?",
                        style: TextStyle(fontSize: 9.sp, color: Colors.green),
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
