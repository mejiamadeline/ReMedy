import 'package:flutter/material.dart';

class AppointmentDetailsPage extends StatefulWidget {
  AppointmentDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AppointmentDetailsPageState createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  final items = List<String>.generate(6, (i) => "info");
  /*List<String> details = [
    details(choice: date),
    details(choice: time),
    details(choice: location),
    details(choice: alarm),
    details(choice: notification),
    details(choice: color),
  ];*/

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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
