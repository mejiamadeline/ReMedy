import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:remedy/Pages/reminder_page.dart';
import 'package:remedy/notifications.dart';

class ReminderDetailsPage extends StatefulWidget {
  ReminderDetailsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ReminderDetailsPageState createState() => _ReminderDetailsPageState();
}

class _ReminderDetailsPageState extends State<ReminderDetailsPage> {
  /*List<String> details = [
    details(choice: type),
    details(choice: medication),
    details(choice: alarm),
    details(choice: notification),
    details(choice: color),
  ];*/
  String type = '';
  String repeat = '';
  String frequency = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reminders'),
          centerTitle: true,
          actions: <Widget>[
          ],
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              getType(),
              const SizedBox(height: 30,),
              getFrequency(),
              const SizedBox(height: 30,),
              getRepeatiting(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                backgroundColor: Colors.black,
                ),
               onPressed: () {
                  Notifications.scheduledNotification(
                    title: 'Test',
                    body: 'This is a test',
                    payload: 'plans at 9:20 am',
                    scheduledDate: DateTime.now().add(Duration(seconds: 3)),
                  );

                 Navigator.pop(
                     context,
                     MaterialPageRoute(
                       builder: (context) =>
                           ReminderPage(title: 'Go'),
                     ));
                 var timestamp = new DateTime.now().millisecondsSinceEpoch;
                 FirebaseDatabase.instance.reference().child(
                     "Reminder/remind" + timestamp.toString()).set(
                     {
                       "Type" : type,
                       "Frequency": frequency,
                       "Repeating": repeat,
                     }
                 ).then((value)
                 {
                   print("success");
                 }).catchError((error){
                   print("failure");
                 });

                 print('Type: ${type}');
                 print('Frequency: ${frequency}');
                 print('Repeating: ${repeat}');
                },
                 child:
                 const Text('Save'),
              ),
            ],
          ),
        ),
      );
    }

  Widget getType() =>
      TextField(
        onChanged: (value) => setState(() => this.type = value),
        decoration: InputDecoration(
          labelText: 'Type of Reminder',
          hintText: 'ex: Medication or Appointment',
          border: OutlineInputBorder(),
        ),
      );

  Widget getFrequency() =>
      TextField(
        onChanged: (value) => setState(() => this.frequency = value),
        decoration: InputDecoration(
          labelText: 'Frequency',
          hintText: 'Every when do you want a reminder?',
          border: OutlineInputBorder(),
        ),
      );

  Widget getRepeatiting() =>
      TextField(
        onChanged: (value) => setState(() => this.repeat = value),
        decoration: InputDecoration(
          labelText: 'Reapeating?',
          hintText: 'One time occurance or not (yes/no)',
          border: OutlineInputBorder(),
        ),
      );
}
