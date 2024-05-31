import 'package:flower_app/body_widgets/product_page/product_page1.dart';
import 'package:flower_app/body_widgets/product_page/product_page2.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController _controller = PageController();
  int counter = 3;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      counter--;
    });
  }

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
              PageViewIndicatorWidget(controller: _controller),
              TitleAndSalesInfoWidget(
                counter: counter,
                incrementCounter: _incrementCounter,
                decrementCounter: _decrementCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
