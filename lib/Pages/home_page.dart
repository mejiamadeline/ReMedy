import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:remedy/Pages/reminder_page.dart';
import 'appointment_page.dart';
import 'medication_page.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

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


