import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_flow/widgets/appbar.dart';
import 'package:faculty_flow/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  // final String uid;
  // ProfilePage({
  //   super.key,
  //   // required this.createdDateAndTime,
  //   required this.uid,

  // });
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _collegeIdController = TextEditingController();
  TextEditingController _collegeEmailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _majorSubjectController = TextEditingController();
  TextEditingController _qualificationController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    if (value.length < 3 || value.length > 30) {
      return 'Name should be between 3 and 30 characters';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Name should contain only alphabets';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length != 10) {
      return 'Phone number should be 10 digits long';
    }
    if (value.startsWith('0')) {
      return 'Phone number should not start with 0';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number should contain only numbers';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateSubject(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a subject';
    }
    if (value.length > 30) {
      return 'Subject should be less than 30 characters';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Subject should contain only alphabets';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    isDense: true,
                    labelStyle: TextStyle(color: Color(0XFF757575)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0XFF757575)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF757575)),
                    ),
                  ),
                  validator: validateName,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(color: Color(0XFF757575)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      labelText: 'Last Name'),
                  validator: validateName,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(color: Color(0XFF757575)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      labelText: 'Email'),
                  validator: validateEmail,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _collegeIdController,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(color: Color(0XFF757575)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      labelText: 'College ID'),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _collegeEmailController,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(color: Color(0XFF757575)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      labelText: 'College Email'),
                  validator: validateEmail,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(color: Color(0XFF757575)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      labelText: 'Phone Number'),
                  validator: validatePhoneNumber,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _majorSubjectController,
                  validator: validateSubject,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(color: Color(0XFF757575)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      labelText: 'Major Subject'),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _qualificationController,
                  validator: validateSubject,
                  decoration: InputDecoration(
                      isDense: true,
                      labelStyle: TextStyle(color: Color(0XFF757575)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF757575)),
                      ),
                      labelText: 'Qualification'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Save the profile information or perform further actions
                    _saveProfile();
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      // Retrieve the entered profile information from the controllers
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String email = _emailController.text;
      String collegeId = _collegeIdController.text;
      String collegeEmail = _collegeEmailController.text;
      String phoneNumber = _phoneNumberController.text;
      String majorSubject = _majorSubjectController.text;
      String qualification = _qualificationController.text;

      try {
        // Initialize Firebase if not already initialized
        if (Firebase.apps.isEmpty) {
          await Firebase.initializeApp();
        }

        // Get the current user
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // User is signed in
          String userId = user.uid;
          print('User ID: $userId');

          // Create a reference to the Firestore collection
          final profileCollection =
              FirebaseFirestore.instance.collection('profile');

          // Create a new document with the user ID as the document ID
          await profileCollection.doc(userId).set({
            'firstName': _firstNameController.text,
            'lastName': _lastNameController.text,
            'email': _emailController.text,
            'collegeId': _collegeIdController.text,
            'collegeEmail': _collegeEmailController.text,
            'phoneNumber': _phoneNumberController.text,
            'majorSubject': _majorSubjectController.text,
            'qualification': _qualificationController.text,
          });

          // Document created successfully
          print('Profile document created for user: $userId');
        } else {
          // User is not signed in
          print('No user is currently signed in.');
        }
      } catch (e) {
        // Error occurred while creating the document
        print('Error creating profile document: $e');
      }
      showSnackBar(context, "Profile updated");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    }

    // Perform further actions with the entered profile information
    // For example, you could save the data to a database or update user information.

    // Display a confirmation or success message

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Profile Saved'),
    //       content: Text('Your profile has been successfully saved.'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(context); // Close the dialog
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
