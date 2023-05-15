import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String label;
  final String title;
  final String duration;
  // final Color labelColor;

  TaskCard({
    required this.label,
    required this.title,
    required this.duration,
    // required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(2.0),
              ),
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
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      if( label == 'Urgent' ){
                      _buildLabel('Urgent', Colors.red),
                      SizedBox(width: 4.0),

                      }
                      else if( label == 'High'){
                      _buildLabel('High', Colors.orange),
                      SizedBox(width: 4.0),

                      }
                      else if( label == 'Normal'){

                      _buildLabel('Normal', Colors.green),
                      SizedBox(width: 4.0),
                      }
                      else {
                      _buildLabel('Low', Colors.blue),

                      }

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
