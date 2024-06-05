import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage1 extends StatefulWidget {
  final Function(DateTime) onDaySelected;

  const CalendarPage1({Key? key, required this.onDaySelected}) : super(key: key);

  @override
  _CalendarPage1State createState() => _CalendarPage1State();
}

class _CalendarPage1State extends State<CalendarPage1> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takvim'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _selectedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
              widget.onDaySelected(selectedDay);
              Navigator.pop(context);
            },
            onFormatChanged: (format) {
               setState(() {
                _calendarFormat = format;
              });
            },
          ),
        ],
      ),
    );
  }
}