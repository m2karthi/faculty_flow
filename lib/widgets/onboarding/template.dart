import 'package:faculty_flow/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';

class ScreenTemp extends StatelessWidget {
  const ScreenTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionSlider(
        initialPage: 0,
        showStatusBar: true,
        dotIndicator: const DotIndicator(
          selectedColor: Color(0xFF907DED),
          unselectedColor: Color(0xFFD9D9D9),
        ),
        items: [
          IntroductionSliderItem(
            logo: Image.asset('assets/onBoard-1.png'),
            title: const Text(
              "Work more effectively",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                  fontStyle: FontStyle.normal,
                  fontSize: 24),
            ),
            subtitle: const SizedBox(
              width: 250,
              child: Text(
                "Efficiently manage all your tasks in one place, so you can spend more time on what really matters to you.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Open Sans',
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          IntroductionSliderItem(
            logo: Image.asset('assets/onBoard-2.png'),
            title: const Text(
              "Optimize every task",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                  fontStyle: FontStyle.normal,
                  fontSize: 32),
            ),
            subtitle: const SizedBox(
              width: 300,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Get a clear overview of your daily, weekly, and monthly tasks, and adjust your plans accordingly.",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Open Sans',
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          IntroductionSliderItem(
            logo: Image.asset('assets/onBoard-3.png'),
            title: const Text(
              "Elevate your productivity",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                  fontStyle: FontStyle.normal,
                  fontSize: 24),
            ),
            subtitle: const SizedBox(
              width: 250,
              child: Text(
                "Maximize your productivity and achieve your goals with our optimized task management app.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Open Sans',
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ],
        next: Next(
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: const Color(0xFF7059DE),
            ),
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          ),
        ),
        done: Done(
          child: Container(
            height: 50,
            width: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: const Color(0xFF7059DE),
            ),
            child: const Center(
              child: Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          curve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 350),
          home: const HomeScreen(),
        ),
        // back: const Back(child: Icon(Icons.arrow_back)),
      ),
    );
  }
}
