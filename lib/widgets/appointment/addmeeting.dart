import 'package:faculty_flow/services/appointment.service.dart';
import 'package:faculty_flow/widgets/appointment/statusbutton.dart';
import 'package:faculty_flow/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMeeting extends StatefulWidget {
  final Function() refresh;
  // final String? Function(String?)? validator;
  const AddMeeting({super.key, required this.refresh});

  @override
  State<AddMeeting> createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
  AppointmentService appointmentService = AppointmentService();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var meetinglist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Schedule a  Meeting ",
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                    color: const Color(0xFF000000)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Title",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black),
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  // const TextField(
                  // decoration: InputDecoration(
                  //   labelText:
                  //       'Enter your suggestion or feedback here (max 500 characters)',
                  //   border: OutlineInputBorder(),
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 40), // <-- SEE HERE
                  // ),
                  // ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your name';
                      }
                      if (value.length < 3) {
                        return "Please Enter min 3 characters";
                      }
                      if (value.length > 20) {
                        return 'Max 20 characters only Allowed';
                      }
                      return null;
                    },
                    controller: title,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      // contentPadding: EdgeInsets.symmetric(vertical: 100),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black),
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(
                    //     RegExp(r"[0-9]"),
                    //   )
                    // ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Phone number';
                      }

                      if (value.length > 10) {
                        return 'Max 10 digits only  Allowed';
                      }
                      return null;
                    },
                    controller: description,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      // contentPadding: EdgeInsets.symmetric(vertical: 100),
                    ),
                  ),
                  const SizedBox(height: 45),
                  GestureDetector(
                    onTap: () async => {
                      if (_formKey.currentState!.validate())
                        {
                          meetinglist = {
                            "title": title.text,
                            'description': description.text,
                            'status': 'pending',
                            'createdAt': DateTime.now(),
                            'fromuid': FirebaseAuth.instance.currentUser!.uid,
                            'touid': '',
                            'startTime': '',
                            'endTime': '',
                          },
                          await appointmentService.addMeeting(meetinglist),
                          Navigator.of(context).pop(),
                          widget.refresh(),
                          showSnackBar(context, "Successfully added"),
                        }
                    },
                    child: StatusButton(
                        color: Colors.black,
                        child: Text(
                          "Add Meeting",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: const Color(0xFF000000)),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
