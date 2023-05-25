import 'package:flutter/material.dart';

class MeetingRequestCard extends StatelessWidget {
  final String fromName;
  final String toName;
  final String dateOfMeeting;
  final String status;
  final String description;
  final String profileImageUrl;
  final String title;

  const MeetingRequestCard({
    required this.fromName,
    required this.toName,
    required this.dateOfMeeting,
    required this.status,
    required this.description,
    required this.profileImageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // height: 100,
      // borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                SizedBox(width: 10),
                Text(fromName),
              ],
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(dateOfMeeting),
                SizedBox(width: 10),
                Text(status),
              ],
            ),
            SizedBox(height: 10),
            Text(description),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
