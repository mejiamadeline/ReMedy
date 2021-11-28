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
  String reminderTime = '';
  String physician = '';
  TimeOfDay time = TimeOfDay(hour: 9, minute: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Appointments'),
          centerTitle: true,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(primary: Colors.redAccent),
              onPressed: () {},
              child: const Text('Save'),
            ),
          ],
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
              const SizedBox(height: 30,),
              getReminderTime(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AppointmentPage(title: 'Go'),
                      ));
                  var timestamp = new DateTime.now().millisecondsSinceEpoch;
                  FirebaseDatabase.instance.reference().child(
                      "Appointment/app" + timestamp.toString()).set(
                      {
                        "Nickname": nickname,
                        "Date": date,
                        "Location": location,
                        "Actual Time": actualTime,
                        "Reminder Time": reminderTime,
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
                  print('Reminder Time: ${reminderTime}');
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
        /*onTap: () async
        {
          var selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
          );
                actualTime = selectedTime!.format(context);
        },
        readOnly: true,*/
        onChanged: (value) => setState(() => this.actualTime = value),
        decoration: InputDecoration(
          labelText: 'Time of Appointment',
          hintText: 'ex: 10:05 AM',
          border: OutlineInputBorder(),
        ),
      );

  Widget getReminderTime() =>
      TextField(
        onChanged: (value) => setState(() => this.reminderTime = value),
        decoration: InputDecoration(
          labelText: 'Reminder Time',
          hintText: 'What time would you like the reminder?',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
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
