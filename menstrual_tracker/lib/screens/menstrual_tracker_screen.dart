import 'package:flutter/material.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/info_widget.dart';
import 'details_screen.dart';

class MenstrualTrackerScreen extends StatefulWidget {
  @override
  _MenstrualTrackerScreenState createState() => _MenstrualTrackerScreenState();
}

class _MenstrualTrackerScreenState extends State<MenstrualTrackerScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi des menstruations'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          CalendarWidget(
            focusedDay: _focusedDay,
            startDate: _startDate,
            endDate: _endDate,
            onDaySelected: (selectedDay) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    selectedDay: selectedDay,
                    onSaveStartDate: (date) {
                      setState(() {
                        _startDate = date;
                        _endDate = null;
                      });
                    },
                    onSaveEndDate: (date) {
                      setState(() {
                        _endDate = date;
                      });
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          InfoWidget(
            startDate: _startDate,
            endDate: _endDate,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
