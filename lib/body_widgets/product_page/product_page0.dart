import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 56, 63),
      body: Container(
        height: screenHeight * 1,
        width: screenWidth * 1,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      controller: _controller,
                      children: [
                        Container(
                          child: Image.asset("assets/iyirmi.png",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          child: Image.asset("assets/iyirmi.png",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          child: Image.asset("assets/iyirmi.png",
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: WormEffect(
                            dotHeight: 7,
                            dotWidth: 7,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: screenWidth * 1,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 22, top: 10),
                                              child: Text(
                                                "Rubber Fig Plant",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 23),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              bottom: 15),
                                                      child: Container(
                                                        height: 20,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    15,
                                                                    39,
                                                                    33),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text(
                                                          "776 sold",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      118,
                                                                      61)),
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: TextButton.icon(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons
                                                                  .star_half_rounded,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      118,
                                                                      61),
                                                              size: 15,
                                                            ),
                                                            label: Text(
                                                              "4.6 (7000 reviews)",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 9),
                                                            )),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color:
                                              Color.fromARGB(255, 0, 118, 61),
                                        )),
                                  ),
                                )),
                          ],
                        ))),
                        Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.blue,
                              child: Text("hi"),
                            )),
                        Expanded(
                            child: Container(
                          color: Colors.green,
                          child: Text("hi"),
                        )),
                      ],
                    ),
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
