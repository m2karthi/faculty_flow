import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_flow/services/appointment.service.dart';
import 'package:faculty_flow/widgets/appointment/statusbutton.dart';
import 'package:faculty_flow/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppoinmentCard extends StatefulWidget {
  final String Title;
  final String description;
  final Timestamp createdDateAndTime;
  // final String phoneNumber;
  final Function refresh;

  // final GestureTapCallback onTap;
  final String statusMessage;
  final String id;
  final bool isSolved;
  final String? endStatus;
  const AppoinmentCard({
    super.key,
    required this.Title,
    required this.description,
    required this.createdDateAndTime,
    // required this.phoneNumber,
    // required this.onTap,
    required this.statusMessage,
    required this.id,
    required this.isSolved,
    required Null Function() onTap,
    required this.refresh,
    required this.endStatus,
  });

  @override
  State<AppoinmentCard> createState() => _AppoinmentCardState();
}

class _AppoinmentCardState extends State<AppoinmentCard> {
  AppointmentService appointmentService = AppointmentService();
  var meetinglist;

  String FormattedDate = "N/A";

  @override
  void initState() {
    super.initState();
    formatDate();
  }

  void formatDate() {
    FormattedDate = DateFormat('yyyy-MM-dd hh:mm a')
        .format(widget.createdDateAndTime.toDate());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 355,
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          height: 190,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/206/206865.png'),
                ),
                title: Text(
                  widget.Title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  widget.description,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              widget.isSolved
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async => {
                              await appointmentService.rejected(
                                  widget.id, DateTime.now()),
                              widget.refresh(),
                              showSnackBar(context, "Rejected Successfully "),
                            },
                            child: StatusButton(
                              color: Colors.black26,
                              child: Text(
                                "Reject",
                                // "Pending",
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async => {
                              // complaintList = {
                              //   // "solvedTime": DateTime.now(),
                              //   "solvedTime": "dksk",
                              // },
                              // await suggestionService.approved(
                              //     id, DateTime.now()),

                              await appointmentService.approved(
                                  widget.id, DateTime.now()),
                              widget.refresh(),
                              showSnackBar(context, "Accepted Successfully "),
                            },
                            child: StatusButton(
                              color: Colors.black,
                              child: Text(
                                'Accept',
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {},
                                // onTap: () async => {
                                //   // complaintList = {
                                //   //   // "solvedTime": DateTime.now(),
                                //   //   "solvedTime": "dksk",
                                //   // },
                                //   // await suggestionService.rejected(
                                //   //     id, DateTime.now()),
                                // },
                                child: StatusButton(
                                  color: Colors.grey[100],
                                  child: Text(
                                    widget.endStatus!,
                                    // "Accepted",
                                    // "Pending",
                                    style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Created  On",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey[800]),
                      ),
                      Text(
                        FormattedDate,
                        // "3/4/2023, 5:30 am",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
