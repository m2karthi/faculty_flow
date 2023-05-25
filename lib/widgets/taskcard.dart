import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String label;
  final String title;
  final String startTime;
  final String endTime;
  // final size = card.size;

  TaskCard({  
    required this.label,
    required this.title,
    required this.startTime,
    required this.endTime,
  });

  final GlobalKey _cardKey = GlobalKey();

  @override

  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     getCardHeight();
  //   });
  // }

  // void getCardHeight() {
  //   final RenderBox cardBox =
  //       _cardKey.currentContext!.findRenderObject() as RenderBox;
  //   setState(() {
  //     _cardHeight = cardBox.size.height;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Color labelColor = _getLabelColor(label);

    return Card(
      elevation: 2.0,
      key: _cardKey,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: labelColor,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 5,
              color: labelColor,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        'Start Time: $startTime',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'End Time: $endTime',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  _buildLabel(label, labelColor),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getLabelColor(String label) {
    switch (label) {
      case 'Urgent':
        return Colors.red;
      case 'High':
        return Colors.orange;
      case 'Normal':
        return Colors.green;
      case 'Low':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Widget _buildLabel(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
