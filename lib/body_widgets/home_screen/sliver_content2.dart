import 'package:flutter/material.dart';

class SliverContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 130,
        width: 100,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(220, 40, 78, 175),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  IconData iconData;
                  String text = "";

                  // Her bir Card için farklı bir icon belirleme
                  switch (index) {
                    case 0:
                      iconData = Icons.trending_up;
                      text = "Trending";
                      break;
                    case 1:
                      iconData = Icons.home_filled;
                      text = "Indoor";
                      break;
                    case 2:
                      iconData = Icons.wb_sunny_outlined;
                      text = "Outdoor";
                      break;
                    case 3:
                      iconData = Icons.auto_graph_outlined;
                      text = "Core";
                      break;
                    case 4:
                      iconData = Icons.cut;
                      text = "Tools";
                      break;
                    default:
                      iconData = Icons.error;
                  }
                  return Container(
                    width: 70,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(iconData),
                          ),
                          Text(
                            text,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
