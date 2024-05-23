import 'package:flutter/material.dart';

class SliverContent3 extends StatelessWidget {
  const SliverContent3({Key? key}) : super(key: key);

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
                    "Recommended",
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
                  child: TextButton(
                    onPressed: () {},
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.navigate_next),
                    ),
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
