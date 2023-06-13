import 'package:faculty_flow/screens/auth/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:faculty_flow/screens/auth/forgot_password.dart';
import 'package:faculty_flow/screens/auth/signup.dart';
import 'package:faculty_flow/screens/home.dart';
import 'package:faculty_flow/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  testWidgets('LoginPage Integration Test', (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that the initial UI is rendered correctly
    expect(find.text("Let's Login Organise your Life"), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text("Don't have an account?"), findsOneWidget);
    expect(find.text('Signup here'), findsOneWidget);

    // Tap the login button without entering any credentials
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify that validation errors are displayed
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);

    // Enter valid email and password
    await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(Key('passwordField')), 'password123');
    await tester.pump();

    // Tap the login button again
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify that the login is successful and navigates to the NavBar screen
    expect(find.byType(NavBar), findsOneWidget);

    // Navigate to the ForgotPasswordPage
    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    // Verify that the ForgotPasswordPage is displayed
    expect(find.byType(ForgotPasswordPage), findsOneWidget);

    // Navigate to the SignUpPage
    await tester.tap(find.text('Signup here'));
    await tester.pumpAndSettle();

    // Verify that the SignUpPage is displayed
    expect(find.byType(SignUpPage), findsOneWidget);
  });
}
