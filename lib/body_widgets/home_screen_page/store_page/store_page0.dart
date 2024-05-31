import 'package:flower_app/body_widgets/home_screen_page/store_page/store_page2.dart';
import 'package:flutter/material.dart';

class HomeScreenSliverContent4 extends StatelessWidget {
  const HomeScreenSliverContent4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "all stores",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MarketPage()),
                      );
                    },
                    icon: Icon(Icons.navigate_next),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
