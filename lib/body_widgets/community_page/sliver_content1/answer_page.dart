import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  final double screenWidth;

  final double screenHeight;

  const AnswerPage(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Answer questions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Your replies',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: screenHeight * 0.055,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search a question...',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.mic, color: Colors.grey),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 8),
                  child: Container(
                    height: screenHeight * 0.045,
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
                                      side: BorderSide(
                                          width: 1, color: Colors.grey)),
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
                                      side: BorderSide(
                                          width: 1, color: Colors.grey)),
                                  onPressed: () {},
                                  child: Center(
                                    child: Text(
                                      "FAQS",
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold),
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
                                      side: BorderSide(
                                          width: 1, color: Colors.grey)),
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
                                    side: BorderSide(
                                        width: 1, color: Colors.grey)),
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
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 206, 204, 204),
                    ),
                    height: screenHeight * 0.17,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 15),
                                  child: Text(
                                    "I needs Plant well i want to make the world is beaituful , can you help me ?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "24 answer",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 5),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 206, 204, 204),
                    ),
                    height: screenHeight * 0.17,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 15),
                                  child: Text(
                                    "I needs Plant well i want to make the world is beaituful , can you help me ?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "24 answer",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 5),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 206, 204, 204),
                    ),
                    height: screenHeight * 0.17,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 15),
                                  child: Text(
                                    "I needs Plant well i want to make the world is beaituful , can you help me ?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "24 answer",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 5),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 206, 204, 204),
                    ),
                    height: screenHeight * 0.17,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 15),
                                  child: Text(
                                    "I needs Plant well i want to make the world is beaituful , can you help me ?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "24 answer",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 5),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 206, 204, 204),
                    ),
                    height: screenHeight * 0.17,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 15),
                                  child: Text(
                                    "I needs Plant well i want to make the world is beaituful , can you help me ?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "24 answer",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 5),
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
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
