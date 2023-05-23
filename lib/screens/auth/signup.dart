import 'package:faculty_flow/screens/auth/login.dart';
import 'package:faculty_flow/screens/home.dart';
import 'package:faculty_flow/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/appbar.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _email;
  late String _password;
   bool _obscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signUp() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        // Sign up successful, handle navigation or other actions here
        print('User signed up: ${userCredential.user!.email}');

        // User registration successful, navigate to the profile page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // User already exists, show an alert to the user
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('User Already Exists'),
                content: Text('A user with the provided email already exists.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          // Other registration errors occurred, handle them accordingly
          print('Registration Error: ${e.message}');
        }
      } catch (e) {
        // Sign up failed, display error message
        print('Sign up failed: $e');
      }
    }
  }

  void _goToLoginPage() {
    Navigator.push(
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
        // title: Image.asset('assets/logobig'),
        // leading: IconButton(
        //     icon: ImageIcon(
        //       AssetImage("assets/logo.png"),
        //       color: Colors.black,
        //       size: 100,
        //     ),
        //     onPressed: () {
        //       // Do something when the menu button is pressed.
        //     },
        //   ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lottie.network('https://assets9.lottiefiles.com/packages/lf20_L7YrbxFm46.json'),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('assets/gettingStatrted.png'),
              ]),
              SizedBox(
                height: 30,
              ),
              Text(
                "Getting Started",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
                // style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize:29),
              ),
              Text("Explore by creating account today!",
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
                          labelStyle: TextStyle(color: Colors.black, fontSize: 18),
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
                     SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (input) => _password = input!,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          isDense: false,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                                  color: Color(0XFF7059DE),
                            ),
                          ),
                          labelStyle: TextStyle(color: Color(0XFF757575), fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0XFF757575)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF757575)),
                            borderRadius: BorderRadius.circular(10),

                          ),
                          labelText: 'Password'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.check_box_outlined),
                        Text(
                          ' I agree to the',
                          style: TextStyle(color: Colors.black, fontSize: 14
                              // decoration: TextDecoration.underline,
                              ),
                        ),
                        GestureDetector(
                          
                          child: Text(
                            ' Terms and Conditions',
                            style:
                                TextStyle(color: Color(0XFF7059DE), fontSize: 14
                                    // decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                        Text(
                          ' and',
                          style: TextStyle(color: Colors.black, fontSize: 14
                              // decoration: TextDecoration.underline,
                              ),
                        ),
                        GestureDetector(
                          child: Text(
                            ' Privacy Policy',
                            style:
                                TextStyle(color: Color(0XFF7059DE), fontSize: 14
                                    // decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),

                    ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), 
                        ),
                        primary: Color(0XFF7059DE), 
                        minimumSize:
                            Size(350, 43),
                             
                      ),
                      child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18),),

                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                        GestureDetector(
                          onTap: _goToLoginPage,
                          child: Text(
                            ' Login here',
                            style: TextStyle(
                              color: Color(0XFF7059DE),
                              fontSize: 14
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
