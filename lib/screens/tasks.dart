import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:faculty_flow/services/task.service.dart';
import 'package:faculty_flow/widgets/taskcard.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:lottie/lottie.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  TaskService _taskService = TaskService();

  //    void initState() {
  //   super.initState();
  //   _fetchProfile();
  // }

  var selectedDate = DateTime.now();
  var firstDate = DateTime(2023, 1, 25);
  var lastDate = DateTime.now().add(const Duration(days: 365 * 4));

  List<Map<String, dynamic>> filterObjectsByDate(
      objects, DateTime selectedDate) {
    return objects.where((obj) {
      var dat = obj['date'];
      print("dat $dat ");
      final dateTime = DateTime.fromMillisecondsSinceEpoch(
          dat.microsecondsSinceEpoch ~/ 1000);
      print("dateTime $dateTime ");
      print("Selected Date $selectedDate");

      return dateTime.year == selectedDate.year &&
          dateTime.month == selectedDate.month &&
          dateTime.day == selectedDate.day;
    }).toList();
  }

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CalendarTimeline(
                initialDate: selectedDate,
                firstDate: firstDate,
                lastDate: lastDate,
                onDateSelected: (date) => setState(() => selectedDate = date),
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
              FutureBuilder(
                  future: _taskService.getTodayTasks(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Display a loading spinner while waiting for data
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Display an error message if the future throws an error
                      return Text("Error: ${snapshot.error}");
                    } else {
                      print("SNapshot $snapshot");
                      print("SNapshot data ${snapshot.data} ");
                      // print("index SNapshot data  ${snapshot.data[0]} ");
                      // var tasksData = snapshot.data;
                      // print("Tasks data ${tasksData['title']}");

                      // List<Map<String, dynamic>> reqtasks =
                      //     filterObjectsByDate(snapshot.data, selectedDate);
                      var reqtasks = [];
                      for (var task in snapshot.data) {
                        var date = task['date'];
                        print("date from fire ${date}");
                        var convertedDate = date.toDate();
                        print("convertedDate from fire ${convertedDate}");

                        var formatDate =
                            DateFormat('yyyy-MM-dd').format(convertedDate);

                        print("formatDate from fire ${formatDate}");
                        print("Selected Date ${selectedDate}");

                        var formatSelectedDate =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                        print(
                            "formatSelectedDate from fire ${formatSelectedDate}");

                        if (formatDate == formatSelectedDate) {
                          reqtasks.add(task);
                        }
                      }

                      print("reqtasks ${reqtasks}");

                      if (reqtasks.length > 0) {
                        return Column(
                          children: [
                            // Text("data")
                            SizedBox(
                              height: 700,
                              width: double.infinity,
                              child: Expanded(
                                child: ListView.builder(
                                    itemCount: reqtasks.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var taskdata = reqtasks[index];
                                      return TaskCard(
                                          label: taskdata['tag'],
                                          title: taskdata['title'],
                                          startTime: taskdata['startTime'],
                                          endTime: taskdata['endTime']);
                                    }),
                              ),
                            ) 
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Container(
                              width: 350, // Set the desired width
                              // height: 200, // Set the desired height
                              child: Lottie.network(
                                  'https://assets9.lottiefiles.com/private_files/lf30_lkquf6qz.json'), // Replace with your Lottie animation file path
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("No Tasks Found! Enjoy by adding new Tasks",
                                style: GoogleFonts.hindSiliguri(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15))
                          ],
                        );
                      }
                    }
                  })
            ],
          ),
        ));
  }
}
