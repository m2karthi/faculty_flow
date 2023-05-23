import 'package:faculty_flow/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late String _email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _resetPassword() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();

      try {
        // await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Email Sent'),
              content: Text(
                  'Password reset email sent to $_email. Please check your inbox and login with your new password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _goToLoginPage();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        // Password reset email sent successfully, handle navigation or other actions here
        print('Password reset email sent to $_email');
        
      } catch (e) {
        // Password reset email failed to send, display error message
        print('Password reset email failed to send: $e');
      }
    }
  }

   void _goToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // Image.asset('assets/gettingStatrted.png'),
                Container(
                  width: 350, // Set the desired width
                  // height: 200, // Set the desired height
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_iwyr6aqu.json'), // Replace with your Lottie animation file path
                )
              ]),
              SizedBox(
                height: 30,
              ),
              Text(
                "Forgot Password  ",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
                // style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize:29),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Regain access to your to-dos.",
                  style: GoogleFonts.openSans(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (input) => _email = input!,
                      decoration: InputDecoration(
                          isDense: false,
                          prefixIcon: Icon(Icons.email_outlined),
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0XFF757575)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF757575)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Email'),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _resetPassword,
                       style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Color(0XFF7059DE),
                        minimumSize: Size(350, 43),
                      ),
                      child: Text('Reset Password',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height:5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.black, fontSize: 14
                              // decoration: TextDecoration.underline,
                              ),
                        ),
                        GestureDetector(
                          onTap: _goToLoginPage,
                          child: Text(
                            ' Login here',
                            style:
                                TextStyle(color: Color(0XFF7059DE), fontSize: 14
                                    // decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
