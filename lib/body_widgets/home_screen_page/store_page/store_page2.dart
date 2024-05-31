import 'package:flower_app/body_widgets/product_page/product_page0.dart';
import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.only(left: 15, right: 15),
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search a question...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
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
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10),
                        child: Icon(Icons.filter_list, color: Colors.black),
                      ),
                      ...List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 15, bottom: 10),
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Option ${index + 1}',
                                    style: TextStyle(color: Colors.black)),
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
                        height: screenHeight * 0.105,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 8),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/flower1.jpg"),
                                    radius: 23,
                                  ),
                                  SizedBox(width: 10),
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
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(Icons.star,
                                              color: Colors.green, size: 16),
                                          Text('5.0',
                                              style: TextStyle(
                                                  color: Colors.green)),
                                        ],
                                      ),
                                      Text('55 reviews',
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('50 euro',
                                          style: TextStyle(fontSize: 14)),
                                      Text('3% bonus',
                                          style: TextStyle(
                                              fontSize: 12,
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
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10),
                        child: Icon(Icons.filter_list, color: Colors.black),
                      ),
                      ...List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 15, bottom: 10),
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Option ${index + 1}',
                                    style: TextStyle(color: Colors.black)),
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
                                                left: 155,
                                                top: 5,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.6),
                                                  radius: 15,
                                                  child: Stack(children: [
                                                    Positioned(
                                                      top: -8,
                                                      left: -9,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.white,
                                                        ),
                                                        onPressed: () {},
                                                        iconSize: 22,
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
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 10),
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
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Text("Market name",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Text(
                                                      "125 euro",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              right: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.pink[400],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                width: 30,
                                                height: 32,
                                              ),
                                            ),
                                            Positioned(
                                              right: 5,
                                              bottom: 1,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .shopping_cart_outlined)),
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
