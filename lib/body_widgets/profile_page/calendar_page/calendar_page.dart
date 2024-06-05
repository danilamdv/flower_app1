import 'package:flower_app/body_widgets/profile_page/calendar_page/calendar_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CalendarPage0 extends StatefulWidget {
  const CalendarPage0({Key? key}) : super(key: key);

  @override
  State<CalendarPage0> createState() => _CalendarPage0State();
}

class _CalendarPage0State extends State<CalendarPage0> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        toolbarHeight: 70.h,
        titleSpacing: 10.w,
        title: Text(
          "Calendar",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
      ),
      body: Container(
        color: Colors.black12,
        width: screenWidth * 1,
        height: screenHeight * 1,
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.r),
                  child: Container(
                    height: 1.h,
                    color: Colors.black12,
                    width: screenWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(11.0.r),
                  child: Container(
                    height: 85.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.r),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CalendarPage1(
                                    onDaySelected: (day) {
                                      setState(() {
                                        selectedDay = day;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 103.0.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Icon(Icons.add_circle_outline,
                                          size: 35.r, color: Color(0xFF6F68DC)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "new reminder",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.r),
                          child: GestureDetector(
                            onTap: () {
                              print("tap");
                            },
                            child: Container(
                              width: 103.0.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Image.network(
                                        "https://img.freepik.com/premium-photo/watercolor-colorful-wildflowers-bouquet-isolated-white-background_779330-1968.jpg?w=740",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "Happy Birthay",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8.sp),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.r),
                          child: GestureDetector(
                            onTap: () {
                              print("tap");
                            },
                            child: Container(
                              width: 103.0.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Image.network(
                                          "https://cdn.shopify.com/s/files/1/0745/4412/0085/products/UFN1450.jpg?v=1698688664&width=856&height=856&crop=center"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "Graduation",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8.sp),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.r),
                          child: GestureDetector(
                            onTap: () {
                              print("tap");
                            },
                            child: Container(
                              width: 103.0.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Image.network(
                                          "https://cdn.shopify.com/s/files/1/0745/4412/0085/products/UFN1450.jpg?v=1698688664&width=856&height=856&crop=center"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "Graduation",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8.sp),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.r, right: 15.r, top: 20.h, bottom: 20.h),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Upcoming dates",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.r, right: 15.r),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: 80.h,
                    width: screenWidth,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 25,
                          child: Padding(
                            padding:  EdgeInsets.all(3.0.r),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('MMM').format(selectedDay),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('d').format(selectedDay),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 50,
                          child: Padding(
                            padding:  EdgeInsets.all(5.0.r),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mary's Birthday",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Wants red roses with chocolate",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 25,
                          child: Padding(
                            padding:  EdgeInsets.all(5.0.r),
                            child: Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Shop',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(75.w, 47.h),
                                  backgroundColor: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
