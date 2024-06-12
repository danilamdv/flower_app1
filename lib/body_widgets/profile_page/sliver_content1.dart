import 'package:flower_app/body_widgets/profile_page/fill_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageSlivercontent1 extends StatelessWidget {
  const ProfilePageSlivercontent1({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: Container(
          width: screenWidth * 1,
          height: 140.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FillProfileScreen(),
                          ));
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/flower1.jpg"),
                      radius: 22.r,
                    ),
                    title: Text(
                      'Jony Coin',
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Monthly home subscription',
                        style: TextStyle(fontSize: 9.sp, color: Colors.grey)),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: ListTile(
                    leading: Icon(
                      Icons.calendar_month,
                      size: 45.r,
                    ),
                    title: Text(
                      'Mary s Brithay',
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Wants red roses',
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.bold)),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
