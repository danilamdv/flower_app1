import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(right: 10, left: 10, top: 5),
          color: Colors.black12,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("assets/flower1.jpg"),
                              radius: 25,
                            ),
                            title: Text('Jony Coin'),
                            subtitle: Text('Monthly home subscription'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        Divider(
                          color: Colors.black12,
                          thickness: 0.5,
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.calendar_month),
                            title: Text('Mary s Brithay'),
                            subtitle: Text('Wants red roses'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ],
                    )),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.shopping_bag_outlined),
                            title: Text('My purchases'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        Divider(
                          color: Colors.black12,
                          thickness: 0.5,
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.monetization_on_outlined),
                            title: Text('SGCoins'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        Divider(
                          color: Colors.black12,
                          thickness: 0.5,
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.calendar_month_outlined),
                            title: Text('Calendar'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        Divider(
                          color: Colors.black12,
                          thickness: 0.5,
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.subscriptions_outlined),
                            title: Text('Subscription'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ],
                    )),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        Divider(
                          color: Colors.black12,
                          thickness: 0.5,
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.location_on_outlined),
                            title: Text('Adresses'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        Divider(
                          color: Colors.black12,
                          thickness: 0.5,
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.support_agent),
                            title: Text('Support'),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
