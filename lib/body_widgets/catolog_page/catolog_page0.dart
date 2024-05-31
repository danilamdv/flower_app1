import 'package:flutter/material.dart';

class CatologPage extends StatefulWidget {
  const CatologPage({
    super.key,
  });

  @override
  State<CatologPage> createState() => _CatologPageState();
}

class _CatologPageState extends State<CatologPage> {
  String selectedCategory = "Occasions";
  List<String> categories = [
    "Occasions",
    "Discounts",
    "Bouquets",
    "Colors",
    "Gifts",
    "Sweets",
    "Plants",
    "Hampers",
    "60 minutes"
  ];
  Map<String, List<String>> products = {
    "Occasions": [
      "All sweets1",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes1"
    ],
    "Discounts": [
      "All sweets2",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes2"
    ], "Bouquets": [
      "All sweets3",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes2"
    ],"Colors": [
      "All sweets4",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes2"
    ],"Gifts": [
      "All sweets5",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes2"
    ],"Sweets": [
      "All sweets6",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes2"
    ],"Plants": [
      "All sweets7",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes2"
    ],"Hampers": [
      "All sweets8",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes2"
    ],"60 minutes": [
      "All sweets9",
      "ChokoBox",
      "Special occasion",
      "Vegan sweets",
      "Loctose free sweets",
      "Healhy sweets",
      "Sweets bouquets",
      " Custom cakes",
      "Bento cakes",
      " Sweets set",
      " Weeding cakes2"
    ],
  };
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
            resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor:Color.fromARGB(204, 218, 218, 218),
      ),
      body: Container(
        width: screenWidth * 1,
        height: screenHeight * 1,
                      color:Color.fromARGB(204, 218, 218, 218) ,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                                      height: screenHeight * 0.06,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: screenHeight * 0.66,
                        child: ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = categories[index];
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                      decoration: BoxDecoration(
                        color: Color.fromARGB(204, 218, 218, 218),
                                      ),
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, top: 15),
                                        child: Text(
                                          categories[index],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )),
                                ));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        height: screenHeight * 0.66,
                        child: ListView.builder(
                          itemCount: products[selectedCategory]!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: const Color.fromARGB(
                                              255, 204, 204, 204)))),
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, top: 15),
                                child: Text(
                                  products[selectedCategory]![index],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
