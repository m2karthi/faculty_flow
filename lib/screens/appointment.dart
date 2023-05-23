import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  bool isCardSelected = false;
  List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'user 1',
      subtitle: 'Meeting Title: Meeting 1\nDate: 2023-05-23\nStart Time: 10:00 AM\nMeeting Type: Pending',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'user2',
      subtitle: 'Meeting Title: Meeting 2\nDate: 2023-05-23\nStart Time: 11:00 AM\nMeeting Type: Pending',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'user3',
      subtitle: 'Meeting Title: Meeting 3\nDate: 2023-05-23\nStart Time: 2:00 PM\nMeeting Type: Scheduled',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 30),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'user4',
      subtitle: 'Meeting Title: Meeting 4\nDate: 2023-05-23\nStart Time: 3:30 PM\nMeeting Type: Scheduled',
    ),
  ];

  void toggleCardSelection() {
    setState(() {
      isCardSelected = !isCardSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StackedNotificationCards(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 2.0,
                ),
              ],
              notificationCardTitle: 'tasks',
              notificationCards: [..._listOfNotification],
              cardColor: Color(0xFFF1F1F1),
              padding: 16,
              actionTitle: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showLessAction: Text(
                'Show less',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              onTapClearAll: () {
                setState(() {
                  _listOfNotification.clear();
                });
              },
              clearAllNotificationsAction: Container(), // Remove the "X" mark
              clearAllStacked: Text(''),
              cardClearButton: Text('accept'),
              cardViewButton: Text('reject'),
              onTapClearCallback: (index) {
                print(index);
                setState(() {
                  _listOfNotification.removeAt(index);
                });
              },
              onTapViewCallback: (index) {
                print(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
