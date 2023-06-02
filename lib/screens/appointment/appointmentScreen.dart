import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_flow/pallets/color.dart';
import 'package:faculty_flow/services/appointment.service.dart';
import 'package:faculty_flow/services/task.service.dart';
import 'package:faculty_flow/widgets/appointment/addmeeting.dart';
import 'package:faculty_flow/widgets/appointment/appointementcard.dart';
import 'package:faculty_flow/widgets/appointment/statusbutton.dart';
import 'package:faculty_flow/widgets/taskcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class Appointmentpage extends StatefulWidget {
  const Appointmentpage({super.key});

  @override
  State<Appointmentpage> createState() => _AppointmentpageState();
}

class _AppointmentpageState extends State<Appointmentpage> {
  AppointmentService appointmentService = AppointmentService();

  TaskService _taskService = TaskService();

  List<dynamic> newSuggestions = [];
  List<dynamic> oldSuggestions = [];

  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 8, 8, 0),
                  child: Text(
                    "Upcoming",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.lightGreen[50],
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        elevation: 20,
                        context: context,
                        builder: (context) {
                          return AddMeeting(refresh: () => setState(() {}));
                        });
                  },
                  child: StatusButton(
                    color: Colors.black,
                    child: Text(
                      "Add meeting",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: appointmentService.getAppointment(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading spinner while waiting for data
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Display an error message if the future throws an error
                  return Text("Error: ${snapshot.error}");
                } else {
                  newSuggestions = snapshot.data;
                  // Call the function from the instance of MyClass and display the fetched data
                  if (newSuggestions.length == 0) {
                    return Text('No Upcoming  Available');
                  } else {
                    // Call the function from the instance of MyClass and display the fetched data
                    return SizedBox(
                      height: 210,
                      width: 405,
                      child: PageView.builder(
                        controller: pageController,
                        itemBuilder: (_, index) {
                          return AnimatedBuilder(
                            animation: pageController,
                            builder: (ctx, child) {
                              return child!;
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 7, top: 0, left: 5, bottom: 0),
                              height: 250,
                              child: AppoinmentCard(
                                onTap: () {},
                                createdDateAndTime: snapshot.data[index]
                                    ['createdAt'] as Timestamp,
                                // phoneNumber: snapshot.data[index]['phone'],
                                statusMessage: snapshot.data[index]['status'],
                                isSolved: false,
                                refresh: () {
                                  setState(() {});
                                },
                                endStatus: snapshot.data[index]['status'],
                                Title: snapshot.data[index]['title'],
                                description: snapshot.data[index]
                                    ['description'],
                                id: snapshot.data[index]['fromuid'],
                                // iscompleted: ,
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data.length,
                      ),
                    );
                  }
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 8, 8, 0),
                  child: Text(
                    "On Request",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            FutureBuilder(
              future: appointmentService.getAppointment(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading spinner while waiting for data
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Display an error message if the future throws an error
                  return Text("Error: ${snapshot.error}");
                } else {
                  oldSuggestions = snapshot.data;
                  if (oldSuggestions.length == 0) {
                    return Text('No Meeting Requested ');
                  } else {
                    // Call the function from the instance of MyClass and display the fetched data
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: 325,
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AppoinmentCard(
                            onTap: () {},
                            createdDateAndTime:
                                snapshot.data[index]['createdAt'] as Timestamp,
                            // phoneNumber: snapshot.data[index]['phone'],
                            statusMessage: snapshot.data[index]['status'],
                            isSolved: true,
                            refresh: () {
                              setState(() {});
                            },
                            endStatus: snapshot.data[index]['status'],
                            Title: snapshot.data[index]['title'],
                            description: snapshot.data[index]['description'],
                            id: snapshot.data[index]['fromuid'],
                            // iscompleted: ,
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
