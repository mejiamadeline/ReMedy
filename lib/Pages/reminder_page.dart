import 'package:firebase_auth/firebase_auth.dart';
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
  var remId = [];
  var selected;
  final DatabaseReference ref =
  FirebaseDatabase.instance.reference().child("users");
  final FirebaseAuth auth = FirebaseAuth.instance;

  void setInfo() async{
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    FirebaseDatabase.instance.reference().child(
        "users/$uid/Reminder")
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
        remId.add(k);
        remindTemp.add(v);
      });
      print(remId);
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
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setInfo();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
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
            trailing: Wrap(
              spacing: 150,
              children: <Widget>[
                Icon(Icons.arrow_drop_down_rounded,
                  color: Colors.grey,
                ),
                IconButton(
                  icon: Icon(Icons.delete,
                    color: Colors.red,),
                  onPressed: () {
                    print("Deleted ID is: " + remId[index]);
                    selected = remId[index];
                    print(selected);
                    deletes(selected);
                    print(selected);
                  },
                ),
              ],
            ),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Date: ${reminderDetails[index]['Date']}'),
                  Text('Time: ${reminderDetails[index]['Time']}'),
                  Text('Repeating: ${reminderDetails[index]['Repeating']}'),
                ],
              )
            ],
          );
        },
      ),
    );
  }
  deletes(var selected) async
  {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    await FirebaseDatabase.instance.reference().child(
        "users/$uid/Reminder").child(selected).remove();
    selected = null;
  }
}
