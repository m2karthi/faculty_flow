import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:faculty_flow/widgets/snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:path/path.dart';

class PdfView extends StatefulWidget {
  const PdfView({super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];

  Future<String> uploadPdf(String fileName, File file) async {
    final refrence =
        FirebaseStorage.instance.ref().child("calender/$fileName.pdf");
    final UploadTask = refrence.putFile(file);
    await UploadTask.whenComplete(() {});
    final downloadLink = await refrence.getDownloadURL();
    return downloadLink;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloadLink = await uploadPdf(fileName, file);
      await _firebase.collection("calender").add({
        "name": fileName,
        "url": downloadLink,
        "uid": FirebaseAuth.instance.currentUser!.uid,
      });
      // setState(() {});

      print("pdf upladed successfully");
      // showSnackBar(context as BuildContext, "Successfully added");
    }
  }

  void getAllPdf() async {
    final results = await _firebase.collection('calender').get();
    pdfData = results.docs.map((e) => e.data()).toList();
    print("hello");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: pickFile, child: Icon(Icons.upload_file_outlined)),
      body: ListView.builder(
        itemCount: pdfData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PdfViewScreen(
                          pdfUrl: pdfData[index]['url'],
                        )));
              },
              child: Container(
                // decoration: BoxDecoration(
                //   // border: Border.all(),
                // ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.upload_file_outlined),
                      Text(
                        pdfData[index]['name'],
                        // "Pdf name"
                      )
                    ]),
              ),
            ),
          );
        },
      ),
      // body: GridView.builder(
      //     // itemCount: 10,
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2),
      //     itemCount: pdfData.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => PdfViewScreen(
      //                       pdfUrl: pdfData[index]['url'],
      //                     )));
      //           },
      //           child: Container(
      //             decoration: BoxDecoration(
      //               border: Border.all(),
      //             ),
      //             child: Column(children: [
      //               Icon(Icons.upload_file_outlined),
      //               Text(
      //                 pdfData[index]['name'],
      //               )
      //             ]),
      //           ),
      //         ),
      //       );
      //     }),
    );
  }
}

class PdfViewScreen extends StatefulWidget {
  final String pdfUrl;
  const PdfViewScreen({super.key, required this.pdfUrl});

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  PDFDocument? document;
  void initialisePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: document != null
          ? PDFViewer(
              document: document!,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
