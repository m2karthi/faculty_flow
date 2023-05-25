import 'package:faculty_flow/screens/TasksByStatusPage.dart';
import 'package:faculty_flow/services/profile.service.dart';
import 'package:faculty_flow/services/task.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';


import '../pallets/color.dart';
import '../widgets/taskcard.dart';
// import '../widgets/taskcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileService _profileService = ProfileService();
  TaskService _taskService = TaskService();

  String _userName = '';
  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    // String uid = ''; // Get the current user's UID

    try {
      Map<String, dynamic> profileData = await _profileService.getProfile();

      setState(() {
        _userName = profileData['firstName'];
      });
    } catch (e) {
      print('Error fetching profile: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, $_userName",
                        style: GoogleFonts.hindSiliguri(
                          fontWeight: FontWeight.w600,
                          fontSize: 29,
                          color: Colors.black,
                        ),
                        // style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize:29),
                      ),
                      Text("Let’s make this day productive",
                          style: GoogleFonts.hindSiliguri(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15))
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/206/206865.png'),
                    maxRadius: 40,
                  ),
                ],
              ),
            ),
            Text(
              "My Tasks",
              style: GoogleFonts.hindSiliguri(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Colors.black,
              ),
              // style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize:29),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksByStatusPage(selectStatus: 'Completed')),
                    );
                  },
                  child: Card(
                      color: Color(0xFF7DC8E7),
                      elevation: 8,
                      child: Container(
                        width: 160,
                        height: 158,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/onBoard-2.png'),
                              ),
                              Text(
                                "Completed",
                                style: GoogleFonts.hindSiliguri(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xFF12175E),
                                ),
                              ),
                              Text(
                                "16 Tasks",
                                style: GoogleFonts.hindSiliguri(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFF12175E),
                                ),
                              ),
                            ]),
                      )),
                ),
                GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TasksByStatusPage(selectStatus: 'Pending')),
                    );
                  },
                  child: Card(
                      color: Color(0xFF7D88E7),
                      elevation: 8,
                      child: Container(
                        width: 160,
                        height: 158,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/onBoard-2.png'),
                              ),
                              Text(
                                "Pending",
                                style: GoogleFonts.hindSiliguri(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "16 Tasks",
                                style: GoogleFonts.hindSiliguri(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TasksByStatusPage(selectStatus: 'Cancelled')),
                    );
                  },
                  child: Card(
                      color: Color(0xFFE77D7D),
                      elevation: 8,
                      child: Container(
                        width: 160,
                        height: 158,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/onBoard-2.png'),
                              ),
                              Text(
                                "Cancelled",
                                style: GoogleFonts.hindSiliguri(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "16 Tasks",
                                style: GoogleFonts.hindSiliguri(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                      )),
                ),
                GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TasksByStatusPage(selectStatus: 'OnRequest')),
                    );
                  },
                  child: Card(
                      color: Color(0xFF81E89E),
                      elevation: 8,
                      child: Container(
                        width: 160,
                        height: 158,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/onBoard-2.png'),
                              ),
                              Text(
                                "On Request",
                                style: GoogleFonts.hindSiliguri(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xFF12175E),
                                ),
                              ),
                              Text(
                                "16 Tasks",
                                style: GoogleFonts.hindSiliguri(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFF12175E),
                                ),
                              ),
                            ]),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today Tasks",
                  style: GoogleFonts.hindSiliguri(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tasks');
                  },
                  child: Text('View All'),
                ),
              ],
            ),

            SingleChildScrollView(
              child: FutureBuilder(
                  future: _taskService.getTodayTasks(),
                  builder:
                      (BuildContext context, AsyncSnapshot snapshot) {
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

                      var selectedDate= DateTime.now();
                     var reqtasks = [];

                      for (var task in snapshot.data) {
                        var date = task['date'];
                        print("date from fire ${date}");
                        var convertedDate = date.toDate();
                        print("convertedDate from fire ${convertedDate}");

                        var formatDate = DateFormat('yyyy-MM-dd').format(convertedDate);

                        print("formatDate from fire ${formatDate}");
                        print("Selected Date ${selectedDate}");

                        var formatSelectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
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
                              height: 200,
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
                  }),
            )

            // Expanded(
            //   child: Container(
            //     height: 200,
            //     child: ListView(
            //       shrinkWrap: true,
            //       // padding: EdgeInsets.all(16.0),
            //       children: [
            // TaskCard(
            //   label: 'Urgent',
            //   title: 'Complete Project Report',
            //   startTime: '9:00 AM',
            //   endTime: '11:30 AM',
            // ),

            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
