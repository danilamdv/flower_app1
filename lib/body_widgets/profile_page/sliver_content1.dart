import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePageSlivercontent1 extends StatelessWidget {
  const ProfilePageSlivercontent1({
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
    );
  }
}
