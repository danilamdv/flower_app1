import 'package:flutter/material.dart';

class CalendarPage1 extends StatefulWidget {
  final Function(DateTime) onDaySelected;

  const CalendarPage1({Key? key, required this.onDaySelected}) : super(key: key);

  @override
  _CalendarPage1State createState() => _CalendarPage1State();
}

class _CalendarPage1State extends State<CalendarPage1> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takvim'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDay,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (pickedDate != null && pickedDate != _selectedDay) {
              setState(() {
                _selectedDay = pickedDate;
              });
              widget.onDaySelected(pickedDate);
              Navigator.pop(context);
            }
          },
          child: Text(
            'Tarih Seçin',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
