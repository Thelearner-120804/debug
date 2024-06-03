import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_application_1/models/booking.dart';

class BookingCalendar extends StatefulWidget {
  final List<Booking> bookings;
  final void Function(DateTime date) onDaySelected;

  const BookingCalendar({super.key, required this.bookings, required this.onDaySelected});

  @override
  BookingCalendarState createState() => BookingCalendarState();
}

class BookingCalendarState extends State<BookingCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        widget.onDaySelected(selectedDay);
      },
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      eventLoader: (day) {
        return widget.bookings
            .where((booking) =>
                isSameDay(booking.startDate, day) ||
                (booking.startDate.isBefore(day) && booking.endDate.isAfter(day)))
            .toList();
      },
    );
  }
}
