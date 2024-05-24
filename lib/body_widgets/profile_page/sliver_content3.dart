import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePageSliverContent3 extends StatelessWidget {
  const ProfilePageSliverContent3({
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
    );
  }
}

