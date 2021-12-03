import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:remedy/Pages/appointment_page.dart';

class AppointmentDetailsPage extends StatefulWidget {
  AppointmentDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AppointmentDetailsPageState createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  String nickname = '';
  String date = '';
  String actualTime = '';
  String location = '';
  String physician = '';
  final DatabaseReference ref =
  FirebaseDatabase.instance.reference().child("users");
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Appointments'),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              getNickname(),
              const SizedBox(height: 30,),
              getDate(),
              const SizedBox(height: 30,),
              getLocation(),
              const SizedBox(height: 30,),
              getPhysician(),
              const SizedBox(height: 30,),
              getActualTime(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  backgroundColor: Colors.black,
                ),
                onPressed: () async {
                  final FirebaseUser user = await auth.currentUser();
                  final uid = user.uid;
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AppointmentPage(title: 'Go'),
                      ));
                  var timestamp = new DateTime.now().millisecondsSinceEpoch;
                  FirebaseDatabase.instance.reference().child(
                      "users/$uid/Appointment/app"
                          + timestamp.toString()).set(
                      {
                        "Nickname": nickname,
                        "Date": date,
                        "Location": location,
                        "Actual Time": actualTime,
                        "Physician": physician,
                      }
                  ).then((value) {
                    print("success");
                  }).catchError((error) {
                    print("failure");
                  });
                  print('Nickname: ${nickname}');
                  print('Date: ${date}');
                  print('Location: ${location}');
                  print('Actual Time: ${actualTime}');
                  print('Physician: ${physician}');
                },

                child: const Text('Save'),
              ),
            ],
          ),
        )
    );
  }

  Widget getNickname() =>
      TextField(
        onChanged: (value) => setState(() => this.nickname = value),
        decoration: InputDecoration(
          labelText: 'Name Related to the Appointment',
          hintText: 'ex: Checkup',
          border: OutlineInputBorder(),
        ),
      );

  Widget getDate() =>
      TextField(
        onChanged: (value) => setState(() => this.date = value),
        decoration: InputDecoration(
          labelText: 'Date of Appointment',
          hintText: 'ex: 10/31/21',
          border: OutlineInputBorder(),
        ),
      );

  Widget getLocation() =>
      TextField(
        onChanged: (value) => setState(() => this.location = value),
        decoration: InputDecoration(
          labelText: 'Location',
          hintText: 'St. Judes - Anaheim',
          border: OutlineInputBorder(),
        ),
      );

  Widget getActualTime() =>
      TextField(
        onChanged: (value) => setState(() => this.actualTime = value),
        decoration: InputDecoration(
          labelText: 'Time of Appointment',
          hintText: 'ex: 10:05 AM',
          border: OutlineInputBorder(),
        ),
      );


  Widget getPhysician() =>
      TextField(
        onChanged: (value) => setState(() => this.physician = value),
        decoration: InputDecoration(
          labelText: 'Physician (optional)',
          hintText: 'ex: Dr. Laura Fields',
          border: OutlineInputBorder(),
        ),
      );

}
