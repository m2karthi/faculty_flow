import 'dart:io';

import 'package:faculty_flow/file/api/pdf_api.dart';
import 'package:faculty_flow/file/page/pdf_viewer_page.dart';
import 'package:faculty_flow/file/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CalanderScreen extends StatelessWidget {
  const CalanderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Asset PDF',
                onClicked: () async {
                  final path = 'assets/sample.pdf';
                  final file = await PDFApi.loadAsset(path);
                  openPDF(context, file);
                },
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: 'File PDF',
                onClicked: () async {
                  final file = await PDFApi.pickFile();

                  if (file == null) return;
                  openPDF(context, file);
                },
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: 'Network PDF',
                onClicked: () async {
                  final url =
                      'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                  final file = await PDFApi.loadNetwork(url);
                  openPDF(context, file);
                },
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: 'Firebase PDF',
                onClicked: () async {
                  final url = 'Suriyaprakash.pdf';
                  final file = await PDFApi.loadFirebase(url);

                  if (file == null) return;
                  openPDF(context, file as File);
                },
                key: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
