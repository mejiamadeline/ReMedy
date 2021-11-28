import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:remedy/InnerPages/reminder_details_page.dart';

class ReminderPage extends StatefulWidget {
  ReminderPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  var reminderDetails = [];

  _ReminderPageState() {
    FirebaseDatabase.instance
        .reference()
        .child("Reminder")
        .once()
        .then((datasnapshot) {
      print("success");
      //print(datasnapshot);
      //print(datasnapshot.key);
      //print(datasnapshot.value);
      var remindTemp = [];
      datasnapshot.value.forEach((k, v) {
        print(k);
        print(v);
        remindTemp.add(v);
      });
      print(remindTemp);
      reminderDetails = remindTemp;
      setState(() {});
    }).catchError((error) {
      print("failure");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReminderDetailsPage(title: 'RemDetials'),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: reminderDetails.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text('${reminderDetails[index]['Type']}'),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Frequency: ${reminderDetails[index]['Frequency']}'),
                  Text('Repeating: ${reminderDetails[index]['Repeating']}'),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
