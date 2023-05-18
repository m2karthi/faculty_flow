import 'package:flutter/material.dart';

import '../widgets/taskcard.dart';

class TasksByStatusPage extends StatefulWidget {
  const TasksByStatusPage({super.key});

  @override
  State<TasksByStatusPage> createState() => _TasksByStatusPageState();
}

class _TasksByStatusPageState extends State<TasksByStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Tasks'),
      ),
      body: Column(
        children: [
          Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  // Filter icon onPressed action
                },
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
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
        ),
        ]
      ),
    );
  }
}