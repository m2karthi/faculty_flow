import 'package:faculty_flow/screens/auth/forgot_password.dart';
import 'package:faculty_flow/screens/auth/signup.dart';
import 'package:faculty_flow/screens/home.dart';
import 'package:faculty_flow/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;
  late String _password;
   bool _obscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        // Login successful, handle navigation or other actions here
        print('User logged in: ${userCredential.user!.email}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavBar()),
        );
      } catch (e) {
        // Login failed, display error message
        print('Login failed: $e');
      }
    }
  }

  void _goToForgotPasswordPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
    );
  }

  void _goToSignUpPasswordPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
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
                      'https://assets3.lottiefiles.com/packages/lf20_nc1bp7st.json'), // Replace with your Lottie animation file path
                )
              ]),
              SizedBox(
                height: 30,
              ),
              Text(
                "Let's Login Organise your Life",
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
              Text("Let’s login for explore continues!",
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
                          // prefixIcon: Icon(Icons.email_outlined),
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
                          labelText: 'Password'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.check_box_outlined),
                            Text(
                              ' Keep me Signed in',
                              style: TextStyle(color: Colors.black, fontSize: 14
                                  // decoration: TextDecoration.underline,
                                  ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: _goToForgotPasswordPage,
                          child: Text(
                            'Forgot Password?',
                            style:
                                TextStyle(color: Color(0XFFF36060), fontSize: 14
                                    // decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Color(0XFF7059DE),
                        minimumSize: Size(350, 43),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    // SizedBox(height: 8.0),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 14
                              // decoration: TextDecoration.underline,
                              ),
                        ),
                        GestureDetector(
                          onTap: _goToSignUpPasswordPage,
                          child: Text(
                            ' Signup here',
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
