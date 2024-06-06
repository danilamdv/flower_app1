import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy', style: TextStyle( fontSize: 15.sp , fontWeight: FontWeight.bold  ), ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '1. Types of Data We Collect',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 8.0.h),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.0.h),
                Text(
                  '2. Use of Your Personal Data',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 8.0.h),
                Text(
                  'Maga diam tempor orci eu lobortis elementum nibh. Vulputate enim nulla aliquet porttitor lacus. Orci sagittis eu volutpat odio facilisis mauris sit amet. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras adipiscing enim eu turpis egestas pretium aenean pharetra. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '3. Disclosure of Your Personal Data',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Consequat id porta nibh venenatis cras sed felis. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Pharetra magna ac placerat vestibulum lectus. Facilisis gravida neque convallis a cras semper auctor neque vitae. Venenatis urna cursus eget nunc. Cras fermentum odio eu feugiat pretium. Nibh sed pulvinar proin gravida hendrerit. Enim ut tellus elementum sagittis vitae et leo duis. Quam pellentesque nec nam aliquam sem et tortor. Massa tempor nec feugiat nisl pretium fusce id velit ut.',
                  style: TextStyle(
                    fontSize: 12.sp,
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
