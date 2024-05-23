import 'package:flower_app/appbar/community_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CommunityAppbar(),
      body: Container(
        padding: EdgeInsets.only(
          right: 18,
          left: 18,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(9.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2.2),
                              color: Colors.grey.withOpacity(0.6),
                            )
                          ]),
                      child: Text(
                        "what do you want to ask or share?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.07,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.message_outlined,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "ask",
                                  )
                                ],
                              )),
                        ),
                        Container(
                          height: screenHeight * 0.02,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          flex: 4,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.message_outlined,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text("Answer")
                                ],
                              )),
                        ),
                        Container(
                          height: screenHeight * 0.02,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.message_outlined,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text("Post")
                                ],
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              height: 1,
              color: Colors.grey,
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: screenHeight * 0.04,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
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
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
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
                                    fontSize: 7.8, fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
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
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)))),
                      ),
                    ),
                    Expanded(
                      flex: 3,
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
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
                                        child:  Icon(
                                          CupertinoIcons.chat_bubble_text,
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
                          padding: const EdgeInsets.only(left: 10),
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
                                icon:Icon(
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
            ) , SliverToBoxAdapter( 
              child: SizedBox( height: 10,),
            ),
                
              SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 206, 215, 219),
                ),
                height: screenHeight * 0.5,
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
                                        "post",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          CupertinoIcons.photo_on_rectangle,
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
                    flex: 9,
                    child: Container( 
                      child: Image.asset("assets/flower1.jpg" , fit: BoxFit.cover ,) ,
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
            )
          ],
        ),
      ),
    );
  }
}
