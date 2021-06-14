import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen();

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [SfGlobalLocalizations.delegate],
      supportedLocales: [
        const Locale('en'),
        const Locale('vi'),
      ],
      locale: const Locale('vi'),
      home: SfCalendar(
        scheduleViewSettings: ScheduleViewSettings(
            hideEmptyScheduleWeek: true,
            appointmentItemHeight: 70,
            appointmentTextStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Nunito')),
        view: CalendarView.schedule,
        firstDayOfWeek: 1,
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Ngày lịch sử',
      color: Colors.blue,
      //recurrenceRule: 'FREQ=DAILY;COUNT=1',
      isAllDay: true));

  meetings.add(Appointment(
      startTime: DateTime(today.year, today.month, 20, 9, 0, 0),
      endTime: DateTime(today.year, today.month, 20, 9, 0, 0),
      subject: 'Ngày lịch sử 2',
      color: Colors.blue,
      isAllDay: true));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
