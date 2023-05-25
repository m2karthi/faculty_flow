import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350, // Set the desired width
              // height: 200, // Set the desired height
              // margin: EdgeInsets.only(top: 50),
              child: Lottie.network(
                  'https://assets6.lottiefiles.com/private_files/lf30_y9czxcb9.json'), // Replace with your Lottie animation file path
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Journal Page",
              style: GoogleFonts.hindSiliguri(
                fontWeight: FontWeight.w600,
                fontSize: 29,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
