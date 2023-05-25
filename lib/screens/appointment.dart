import 'package:faculty_flow/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  String status = 'Pending';

  void acceptRequest() {
    setState(() {
      status = 'Accepted';
    });
  }

  void rejectRequest() {
    setState(() {
      status = 'Rejected';
    });
  }

  void cancelRequest() {
    setState(() {
      status = 'Cancelled';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Appointments",
                style: GoogleFonts.hindSiliguri(
                  fontWeight: FontWeight.w600,
                  fontSize: 29,
                  color: Colors.black,
                ),
              ),
            ),
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                height: 100.0,
                padding: EdgeInsets.all(16.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/206/206865.png'),
                  ),
                  title: Text(
                    'Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Description of the meeting (max 1 line)',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Container(
                    height:120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.check),
                                          title: Text('Accept'),
                                          onTap: acceptRequest,
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.clear),
                                          title: Text('Reject'),
                                          onTap: rejectRequest,
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.cancel),
                                          title: Text('Cancel'),
                                          onTap: cancelRequest,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
