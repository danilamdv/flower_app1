import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _passwordController0 = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  bool _obscureText0 = true;
  bool _obscureText1 = true;
  bool _isChecked = false;
  Color _passwordIconColor = Colors.grey;

  void _togglePasswordVisibility0() {
    setState(() {
      _obscureText0 = !_obscureText0;
    });
  }

  void _togglePasswordVisibility1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _continue() {
    String newpassword = _passwordController0.text;
    String retypepassword = _passwordController1.text;
    print('newpassword: $newpassword, retypePassword: $retypepassword');
  }

  @override
  void dispose() {
    _passwordController0.dispose();
    _passwordController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Create New Password",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/sucess.svg',
                      height: 200.0.h,
                    ),
                  ),
                ),
                Text(
                  "Create Your New Password",
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0.h),
                _buildPasswordField(
                  controller: _passwordController0,
                  obscureText: _obscureText0,
                  toggleVisibility: _togglePasswordVisibility0,
                  label: 'New Password',
                ),
                SizedBox(height: 20.0.h),
                _buildPasswordField(
                  controller: _passwordController1,
                  obscureText: _obscureText1,
                  toggleVisibility: _togglePasswordVisibility1,
                  label: 'Retype New Password',
                ),
                SizedBox(height: 20.0.h),
                _buildRememberMeCheckbox(),
                SizedBox(height: 20.0.h),
                Container(
                  width: screenWidth,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _continue,
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

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleVisibility,
    required String label,
  }) {
    return Container(
      height: 50.h,
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _passwordIconColor = hasFocus ? Colors.green : Colors.grey;
          });
        },
        child: TextField(
          cursorColor: Colors.green,
          style: TextStyle(fontSize: 10.sp),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            labelText: label,
            labelStyle: TextStyle(fontSize: 10.sp),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _passwordIconColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: _passwordIconColor,
              size: 20.r,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                size: 20.r,
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: _passwordIconColor,
              ),
              onPressed: toggleVisibility,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 20.h,
      child: Padding(
        padding: EdgeInsets.only(right: 25.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
              activeColor: Colors.green,
            ),
            Text(
              'Remember me',
              style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
