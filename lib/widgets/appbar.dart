import 'package:faculty_flow/screens/addTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../screens/TasksByStatusPage.dart';
import '../screens/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

    int currentPage = 0;
  List<Widget> pages =  [
    HomeScreen(),
    AddTaskPage(),
    // TasksByStatusPage(),
    

  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int selectedIndex = 0; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Faculty Flow', style: TextStyle(
          //             color: Colors.black,
          //             fontWeight: FontWeight.w600,
          //             fontFamily: 'Open Sans',
          //             fontStyle: FontStyle.normal,
          //             fontSize: 22),
          //       ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: ImageIcon(
              AssetImage("assets/logo.png"),
              color: Colors.black,
              size: 50,
            ),
            onPressed: () {
              // Do something when the menu button is pressed.
            },
          ),
          actions: [
            IconButton(
              icon: ImageIcon(
                AssetImage("assets/calendar_icon.png"),
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {
                // Do something when the search button is pressed.
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                // Do something when the settings button is pressed.
              },
            ),
          ],
        ),
        body: Center(
          child: pages.elementAt(selectedIndex),
          
        ),
        bottomNavigationBar: Container(
          clipBehavior:
              Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Fixed
            backgroundColor: Colors.black, // <-- This works for fixed
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.schedule,
                  size: 30,
                ),
                label: 'Appointment',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.search_rounded,
              //     size: 30,
              //   ),
              //   label: 'Search',
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
                label: 'Add Task',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_view_month,
                  size: 30,
                ),
                label: 'Calender',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.document_scanner,
                  size: 30,
                ),
                label: 'Journel',
              ),
            ],
            currentIndex: selectedIndex,
            // fixedColor: Colors.deepPurple,
            onTap: onItemTapped,
          ),
        ));
  }
}