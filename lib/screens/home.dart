import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pallets/color.dart';
// import '../widgets/taskcard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
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
                        "Hi, Kishore",
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
                Card(
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
                Card(
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
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
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
                Card(
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
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Today Tasks",
                  style: GoogleFonts.hindSiliguri(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // TaskCard(
            //   title: 'Complete Assignment',
            //   duration: '1 hour',
            //   label: 'Urgent',
            //   labelColor: Colors.red,
            // ),
          ],
        ),
      ),
    );
  }
}
