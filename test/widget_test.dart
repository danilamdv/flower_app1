import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CircleAvatar with Icon'),
        ),
        body: Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // İkonun arka plan rengini beyaz yaparak daha görünür hale getirebilirsiniz
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(3), // İkonun boyutunu küçültmek için biraz padding ekleyin
                  child: Icon(
                    Icons.check_circle, // İstediğiniz ikonu burada belirleyin
                    color: Colors.green, // İkonun rengini burada belirleyin
                    size: 20, // İkonun boyutunu burada belirleyin
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
