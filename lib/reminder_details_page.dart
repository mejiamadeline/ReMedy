import 'package:flutter/material.dart';

class ReminderDetailsPage extends StatefulWidget {
  ReminderDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ReminderDetailsPageState createState() => _ReminderDetailsPageState();
}

class _ReminderDetailsPageState extends State<ReminderDetailsPage> {
  final items = List<String>.generate(5, (i) => "info");
  /*List<String> details = [
    details(choice: type),
    details(choice: medication),
    details(choice: alarm),
    details(choice: notification),
    details(choice: color),
  ];*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(primary: Colors.redAccent),
            onPressed: () {},
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
