import 'package:flower_app/body_widgets/product_page/product_page0.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
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
          title: Text('Product'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.14),
            child: Padding(
              padding: EdgeInsets.only(left: 15.r, right: 15.r),
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.r),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20.r,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Search a question...',
                              labelStyle: TextStyle(fontSize: 9.sp),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: 'Market'),
                        Tab(text: 'Product'),
                      ],
                    ),
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.r, top: 10.h, bottom: 10.h),
                        child: Icon(Icons.filter_list, color: Colors.black),
                      ),
                      ...List.generate(10, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 5.r, right: 5.r, top: 15.h, bottom: 10.h),
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Option ${index + 1}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10.sp)),
                                Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: screenHeight * 0.110,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 12.r, right: 12.r, bottom: 8.h),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/flower1.jpg"),
                                    radius: 23.r,
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Flower Club',
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 5.w),
                                          Icon(Icons.star,
                                              color: Colors.green, size: 15.sp),
                                          Text('5.0',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 9.sp)),
                                        ],
                                      ),
                                      Text('55 reviews',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 9.sp)),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('50 euro',
                                          style: TextStyle(fontSize: 10.sp)),
                                      Text('3% bonus',
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.r, top: 10.h, bottom: 10.h),
                        child: Icon(Icons.filter_list, color: Colors.black),
                      ),
                      ...List.generate(10, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 5.r, right: 5.r, top: 15.h, bottom: 10.h),
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Option ${index + 1}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10.sp)),
                                Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductPage()),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 6,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Stack(
                                            children: [
                                              Image.asset("assets/flower1.jpg"),
                                              Positioned(
                                                right: 5.r,
                                                top: 6.h,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.6),
                                                  radius: 15.r,
                                                  child: Stack(children: [
                                                    Positioned(
                                                      top: -8.h,
                                                      left: -9.r,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.white,
                                                        ),
                                                        onPressed: () {},
                                                        iconSize: 22.r,
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 4,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.r, bottom: 10.h),
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Flower name 101",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Text("Market name",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Text(
                                                      "125 euro",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 8.h,
                                              right: 8.r,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.pink[400],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                width: 26.w,
                                                height: 28.h,
                                              ),
                                            ),
                                            Positioned(
                                              right: -4.r,
                                              bottom: -1.h,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons
                                                        .shopping_cart_outlined,
                                                    size: 19.r,
                                                  )),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: 6,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.94,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
