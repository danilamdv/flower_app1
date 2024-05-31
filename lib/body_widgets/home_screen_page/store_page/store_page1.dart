import 'package:flower_app/body_widgets/product_page/product_page0.dart';
import 'package:flutter/material.dart';

class HomeScreenSliverGrid1 extends StatelessWidget {
  const HomeScreenSliverGrid1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductPage()),
              );
            },
            child: Card(
              child: Container(
                alignment: Alignment.center,
                child: Text('store page item : $index'),
              ),
            ),
          );
        },
        childCount: 4,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
    );
  }
}
