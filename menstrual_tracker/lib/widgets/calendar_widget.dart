import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final DateTime focusedDay;
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime) onDaySelected;

  const CalendarWidget({
    Key? key,
    required this.focusedDay,
    required this.startDate,
    required this.endDate,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'fr_FR',
      focusedDay: widget.focusedDay,
      firstDay: DateTime.utc(2000),
      lastDay: DateTime.utc(2100),
      calendarFormat: _calendarFormat,
      availableCalendarFormats: const {
        CalendarFormat.week: 'Semaine',
        CalendarFormat.month: 'Mois',
      },
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      selectedDayPredicate: (day) {
        if (widget.startDate != null && widget.endDate != null) {
          return day.isAfter(
                  widget.startDate!.subtract(const Duration(days: 1))) &&
              day.isBefore(widget.endDate!.add(const Duration(days: 1)));
        }
        return false;
      },
      onDaySelected: (selectedDay, focusedDay) {
        widget.onDaySelected(selectedDay);
      },
    );
  }
}
