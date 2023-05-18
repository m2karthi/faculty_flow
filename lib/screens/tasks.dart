import 'package:faculty_flow/widgets/taskcard.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  // late DateTime selectedDate;
  // late DateTime firstDate;
  // late DateTime lastDate;
  var tasks = [
    { 
      "title": 'Complete Project Report'

    }
  ];

  // void initState() {
  //   super.initState();
    var selectedDate = DateTime.now();
    var firstDate = DateTime.now();
    var lastDate = DateTime.now().add(const Duration(days: 365 * 4));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CalendarTimeline(
              initialDate: selectedDate,
              firstDate: firstDate,
              lastDate: lastDate,
              onDateSelected:(date) => setState(() => selectedDate = date),
              leftMargin: 20,
              monthColor: Colors.blue.shade300,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Color(0xFF7D88E7),
              dotsColor: Colors.white,
              // selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            ),
            SizedBox(
              height: 10,
            ),
          Expanded(
              child: ListView(
                // padding: EdgeInsets.all(16.0),
                children: [
                  TaskCard(
                    label: 'Urgent',
                    title: 'Complete Project Report',
                    startTime: '9:00 AM',
                    endTime: '11:30 AM',
                  ),
                  TaskCard(
                    label: 'High',
                    title: 'Meeting with Team',
                    startTime: '2:00 PM',
                    endTime: '3:00 PM',
                  ),
                  TaskCard(
                    label: 'Normal',
                    title: 'Send Progress Update',
                    startTime: '4:30 PM',
                    endTime: '5:00 PM',
                  ),
                  TaskCard(
                    label: 'Low',
                    title: 'Organize Files',
                    startTime: '6:00 PM',
                    endTime: '7:00 PM',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
