import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AskQuestionPage extends StatelessWidget {
  const AskQuestionPage(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ask a question",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.11,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage("assets/profilphoto.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      'Rohan B',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                          iconSize: 22,
                          onPressed: () {},
                          icon: Transform.rotate(
                              angle: 1.7, child: Icon(CupertinoIcons.tags))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Type your question here...',
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: screenHeight * 0.055,
        width: screenWidth * 0.23,
        child: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          label: Text(
            "Ask",
            style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: const Color.fromARGB(170, 0, 106, 98),
          onPressed: () {},
        ),
      ),
    );
  }
}
