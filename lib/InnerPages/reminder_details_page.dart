import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:remedy/Pages/reminder_page.dart';


class ReminderDetailsPage extends StatefulWidget {
  ReminderDetailsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ReminderDetailsPageState createState() => _ReminderDetailsPageState();
}

class _ReminderDetailsPageState extends State<ReminderDetailsPage> {
  String type = '';
  String repeat = '';
  String date = '';
  String time = '';
  final DatabaseReference ref =
  FirebaseDatabase.instance.reference().child("users");
  final FirebaseAuth auth = FirebaseAuth.instance;


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
              getTime(),
              const SizedBox(height: 30,),
              getDate(),
              const SizedBox(height: 30,),
              getRepeatiting(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                backgroundColor: Colors.black,
                ),
               onPressed: () async{
                 Navigator.pop(
                     context,
                     MaterialPageRoute(
                       builder: (context) =>
                           ReminderPage(title: 'Go'),
                     ));
                 final FirebaseUser user = await auth.currentUser();
                 final uid = user.uid;
                 var timestamp = new DateTime.now().millisecondsSinceEpoch;
                 FirebaseDatabase.instance.reference().child(
                     "users/$uid/Reminder/remind"
                         + timestamp.toString()).set(
                     {
                       "Type" : type,
                       "Date": date,
                       "Time": time,
                       "Repeating": repeat,
                     }
                 ).then((value)
                 {
                   print("success");
                 }).catchError((error){
                   print("failure");
                 });

                 print('Type: ${type}');
                 print('Time: ${time}');
                 print('Date: ${date}');
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
          hintText: 'Appointment or Medicine',
          border: OutlineInputBorder(),
        ),
      );

  Widget getDate() =>
      TextField(
        onChanged: (value) => setState(() => this.date = value),
        decoration: InputDecoration(
          labelText: 'Date',
          hintText: 'ex: 10/02/21',
          border: OutlineInputBorder(),
        ),
      );

  Widget getTime() =>
      TextField(
        onChanged: (value) => setState(() => this.time = value),
        decoration: InputDecoration(
          labelText: 'Time of Reminder',
          hintText: 'ex: 10:05 AM',
          border: OutlineInputBorder(),
        ),
    );

  Widget getRepeatiting() =>
      TextField(
        onChanged: (value) => setState(() => this.repeat = value),
        decoration: InputDecoration(
          labelText: 'Reapeating?',
          hintText: 'No, Daily, Weekly, or Monthly',
          border: OutlineInputBorder(),
        ),
      );

}
