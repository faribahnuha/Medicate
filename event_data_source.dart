import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  Color getColor(int index) => getEvent(index).backgroundColor;

  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;  

  @override
  Widget getEventWidget(Appointment appointment) {
    final event = appointment as Event;
    return ListTile(
      title: Text(event.title),
      trailing: Checkbox(
        value: event.completed,
        onChanged: null, // Disable interaction here; handled in the dialog
      ),
    );
  }
}  

