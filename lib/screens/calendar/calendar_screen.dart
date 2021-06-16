import 'package:flutter/material.dart';
import 'package:hisapp/models/Anniversary.dart';
import 'package:hisapp/providers/AnniversaryProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen();

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  List<Appointment> _getAppointments(List<Anniversary> list) {
    Appointment appointment;
    List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    if (list.length > 0) {
      //print(list[0].content);
      list.forEach((element) {
        appointment = Appointment(
          startTime: DateTime(
            today.year,
            element.month,
            element.day,
          ),
          endTime: DateTime(
            today.year,
            element.month,
            element.day,
          ),
          subject: element.content,
          isAllDay: true,
          color: Colors.blue,
        );
        meetings.add(appointment);
      });
    }
    return meetings;
  }

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
      home: SafeArea(
        child: FutureBuilder(
          future: Provider.of<AnniversaryProvider>(context, listen: false)
              .getAllData(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else
              return Consumer<AnniversaryProvider>(builder: (ctx, data, child) {
                return SfCalendar(
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
                  dataSource:
                      MeetingDataSource(_getAppointments(data.anniversaryList)),
                );
              });
          },
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
