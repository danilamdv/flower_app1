import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityCardSliverContent2 extends StatelessWidget {
  const CommunityCardSliverContent2({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: screenHeight * 0.04,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: 70,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          foregroundColor: Colors.black,
                          side: BorderSide(width: 1, color: Colors.grey)),
                      onPressed: () {},
                      child: Center(
                        child: Text("all",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          foregroundColor: Colors.black,
                          side: BorderSide(width: 1, color: Colors.grey)),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "FAQS",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          foregroundColor: Colors.black,
                          side: BorderSide(width: 1, color: Colors.grey)),
                      onPressed: () {},
                      child: Center(
                          child: Text("Gardening",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold)))),
                ),
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        foregroundColor: Colors.black,
                        side: BorderSide(width: 1, color: Colors.grey)),
                    onPressed: () {},
                    child: Center(
                        child: Text("Plantcore",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
