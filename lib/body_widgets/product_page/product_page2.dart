import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndSalesInfoWidget extends StatelessWidget {
  final int counter;
  final VoidCallback incrementCounter;
  final VoidCallback decrementCounter;

  TitleAndSalesInfoWidget({
    required this.counter,
    required this.incrementCounter,
    required this.decrementCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 22.r, top: 10.h),
                                  child: Text(
                                    "Rubber Fig Plant",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 22.r),
                                        child: Container(
                                          height: 20.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 15, 39, 33),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "776 sold",
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              color: Color.fromARGB(
                                                  255, 0, 118, 61),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: TextButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star_half_rounded,
                                            color:
                                                Color.fromARGB(255, 0, 118, 61),
                                            size: 15.r,
                                          ),
                                          label: Text(
                                            "4.6 (7000 reviews)",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.r),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Color.fromARGB(255, 0, 118, 61),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 22.r, left: 22.r, bottom: 10.h),
                child: Container(
                  color: Colors.grey,
                  height: 1.h,
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 22.r,
                            ),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 22.r, right: 22.r),
                            child: Text(
                              " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing dnlsfnslnfskfnklsfnsnl",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 22.r,
                                    ),
                                    child: Text(
                                      "Quantity",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 25.h,
                                      width: 30.w,
                                      child: ElevatedButton(
                                        onPressed: decrementCounter,
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.transparent,
                                          backgroundColor:
                                              Color.fromARGB(255, 53, 56, 63),
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Color.fromARGB(255, 53, 56, 63),
                                      height: 25.h,
                                      width: 30.w,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$counter',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                      width: 30.w,
                                      child: ElevatedButton(
                                        onPressed: incrementCounter,
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.transparent,
                                          backgroundColor:
                                              Color.fromARGB(255, 53, 56, 63),
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22.r, right: 22.r),
                child: Container(
                  color: Colors.grey,
                  height: 1.h,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 22.r),
                                child: Text(
                                  "Total price",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 5, top: 5, left: 22.r),
                                child: Text(
                                  "\$72",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(right: 22.r, left: 10.r),
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 0, 118, 61),
                              ),
                              icon: Icon(
                                size: 17.r,
                                Icons.shopping_bag,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
