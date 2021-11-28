import 'package:flutter/material.dart';
import 'package:remedy/InnerPages/appointment_details_page.dart';
import 'package:remedy/Pages/appointment_page.dart';
import 'package:remedy/Unused/calendar_page.dart';
import 'package:remedy/Pages/home_page.dart';
import 'package:remedy/Unused/login_page.dart';
import 'package:remedy/InnerPages/medication_details_page.dart';
import 'package:remedy/Pages/medication_page.dart';
import 'package:remedy/InnerPages/reminder_details_page.dart';
import 'package:remedy/Pages/reminder_page.dart';
import 'package:remedy/Unused/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Remedy',),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages =
  [
    MedicationPage(title: 'Meds'),
    HomePage(title: 'Home',),
    ReminderPage(title: 'Rem',),
    AppointmentPage(title: 'App',),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_outlined,
            ),
            label: 'Medications',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rtl_sharp),
            label: 'Reminders',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_outlined),
            label: 'Appointments',
            backgroundColor: Colors.blue,
          ),
        ],

        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        //showUnselectedLabels: false,
        // showSelectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),

    );
  }
}
