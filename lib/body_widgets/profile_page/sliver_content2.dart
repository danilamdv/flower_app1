import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePageSliverContent2 extends StatelessWidget {
  const ProfilePageSliverContent2({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}

