import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EReceiptPage extends StatelessWidget {
  EReceiptPage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Receipt'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.r, right: 15.r),
              child: Container(
                width: screenWidth,
                height: 110.h,
                child: Image.asset(
                  "assets/qrcode.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 15.r, right: 15.r, top: 5.h, bottom: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.blue.shade50,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/flower1.jpg"),
                    radius: 23.r,
                  ),
                  title: Text(
                    'Prayer Plant',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                  ),
                  subtitle: Text('QTY=1',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 9.sp)),
                  onTap: () {
                    print('ListTile tıklandı');
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.r, right: 15.r),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade50),
                height: 150.h,
                child: Column(
                  children: [
                    Expanded(child: Row( 
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [ 
                         Padding(
                           padding:  EdgeInsets.only(left: 10.r),
                           child: Text("Amound"),
                         ), 
                         Spacer(),
                         Padding(
                           padding:  EdgeInsets.only(right: 10.r),
                           child: Text("\$29"),
                         ),
                      ],
                    )),
                   Expanded(child: Row( 
                     crossAxisAlignment: CrossAxisAlignment.center ,
                     children: [ 
                        Padding(
                          padding:  EdgeInsets.only(left: 10.r),
                          child: Text("Promo" , style:  TextStyle( color: Colors.green ),),
                        ), 
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(right: 10.r),
                          child: Text("\$-29" , style:  TextStyle( color: Colors.green )),
                        ),
                     ],
                   )), Expanded(child: Row( 
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [ 
                         Padding(
                           padding:  EdgeInsets.only(left: 10.r),
                           child: Text("Total"),
                         ), 
                         Spacer(),
                         Padding(
                           padding:  EdgeInsets.only(right: 10.r),
                           child: Text("\$21"),
                         ),
                      ],
                    )),
                  ],
                ),
              ),
            ) ,  Padding(
              padding: EdgeInsets.only(left: 15.r, right: 15.r , top: 15.h),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade50),
                height: 200.h,
                child: Column(
                  children: [
                    Expanded(child: Row( 
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [ 
                         Padding(
                           padding:  EdgeInsets.only(left: 10.r),
                           child: Text("Payment Methods "),
                         ), 
                         Spacer(),
                         Padding(
                           padding:  EdgeInsets.only(right: 10.r),
                           child: Text("My E-Wallet"),
                         ),
                      ],
                    )),
                   Expanded(child: Row( 
                     crossAxisAlignment: CrossAxisAlignment.center ,
                     children: [ 
                        Padding(
                          padding:  EdgeInsets.only(left: 10.r),
                          child: Text("Done" , ),
                        ), 
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(right: 10.r),
                          child: Text("Dec 15.2024" ,),
                        ),
                     ],
                   )), Expanded(child: Row( 
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [ 
                         Padding(
                           padding:  EdgeInsets.only(left: 10.r),
                           child: Text("Transaction ID"),
                         ), 
                         Spacer(),
                         Padding(
                           padding:  EdgeInsets.only(right: 10.r),
                           child: Text("1234567890"),
                         ),
                      ],
                    )),Expanded(child: Row( 
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [ 
                         Padding(
                           padding:  EdgeInsets.only(left: 10.r),
                           child: Text("Status"),
                         ), 
                         Spacer(),
                         Padding(
                           padding:  EdgeInsets.only(right: 10.r),
                           child: Text("good"),
                         ),
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
