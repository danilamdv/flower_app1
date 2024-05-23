import 'package:flower_app/appbar/card_appbar.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CardAppbar() ,
      body: Container(
      padding: EdgeInsets.all(18),
                color: Colors.black12,


          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Image.asset("assets/empty-cart.png")),
          Text(
            "Your cart is empty",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("You dont have any addeded to card yet ",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      )),
    );
  }
}
