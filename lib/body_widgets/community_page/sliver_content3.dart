import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityCardSliverontent3 extends StatelessWidget {
  const CommunityCardSliverontent3({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 206, 204, 204),
        ),
        height: screenHeight * 0.25,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage: AssetImage(
                                "assets/profilphoto.jpg",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sarah",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                "June 11",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Question",
                                style: TextStyle(fontSize: 11),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10),
                                child: Icon(
                                  CupertinoIcons.text_bubble,
                                  size: 22,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                      "I needs Plant well i want to make the world is beaituful , can you help me ?"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    TextButton.icon(
                        label: Text(
                          "43",
                          style: TextStyle(
                              fontSize: 11, color: Colors.black),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          color: Colors.black,
                          CupertinoIcons.hand_thumbsup_fill,
                          size: 23,
                        )),
                    TextButton.icon(
                        label: Text(
                          "Reply",
                          style: TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          color: Colors.black,
                          CupertinoIcons.arrow_turn_up_left,
                          size: 22,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}