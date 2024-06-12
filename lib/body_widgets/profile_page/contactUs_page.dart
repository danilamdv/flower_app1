import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.phone_outlined, size: 20.r),
                    SizedBox(width: 5.w),
                    Text(
                      '+44 20 3962 2362',
                      style: TextStyle(
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                'Social media',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {},
                    iconSize: 36.r,
                  ),
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {},
                    iconSize: 36.r,
                  ),
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {},
                    iconSize: 36.r,
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Text(
                'Our store and working hours',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.h),
              Text(
                '2nd Floor The Port House, Port Solent,\nUnited Kingdom, PO6 4TH',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                'Mon - Fri: 9 am - 6 pm GMT\nSat - Sun: 10 am - 6 pm GMT',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(height: 25.h),
              Text(
                'Contact form',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.h),
              Text(
                'If you prefer to write to us, please complete the Contact Form below. We will respond to every email within 24 hours, Sunday through Monday.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(height: 25.h),
              Container(
                height: 45.h,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('First name: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.sp)),
                      ],
                    ),
                    labelText: 'First name',
                    labelStyle: TextStyle(fontSize: 12.sp),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 45.h,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Last name: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.sp)),
                      ],
                    ),
                    labelText: 'Last name',
                    labelStyle: TextStyle(fontSize: 12.sp),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 45.h,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('From: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.sp)),
                      ],
                    ),
                    labelText: 'Enter your Email',
                    labelStyle: TextStyle(fontSize: 12.sp),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 45.h,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('To: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.sp)),
                      ],
                    ),
                    labelText: 'piony_piony@gmail.com',
                    labelStyle: TextStyle(fontSize: 12.sp),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  label: Text("Messages"),
                  labelStyle: TextStyle(fontSize: 12.sp),
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Send', style: TextStyle(fontSize: 14.sp)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
