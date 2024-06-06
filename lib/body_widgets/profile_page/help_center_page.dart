import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPage();
}

class _HelpCenterPage extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Help Center',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 20.r,
                ))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.05),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  TabBar(
                    dividerColor: Colors.black12,
                    labelColor: Colors.green,
                    indicatorColor: Colors.green,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2.0,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'FAQ',
                      ),
                      Tab(text: 'Contact us'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(10, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 10.r, right: 5.r, top: 15.h, bottom: 10.h),
                          child: Container(
                            height: screenHeight * 0.045,
                            width: screenWidth * 0.35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Option ${index + 1}',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 15.r, right: 15.r),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.r, top: 5.r),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.headset_mic, color: Colors.green),
                          title: Text(
                            'Customer Service',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.r),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.add, color: Colors.green),
                          title: Text('Whatsapp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.language, color: Colors.green),
                          title: Text('Website',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.facebook, color: Colors.green),
                          title: Text('Facebook',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.add, color: Colors.green),
                          title: Text('Twitter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.camera_alt, color: Colors.green),
                          title: Text('Instagram',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp)),
                        ),
                      ),
                    ),
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
