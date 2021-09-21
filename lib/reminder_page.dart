import 'package:flutter/material.dart';

class ReminderPage extends StatefulWidget {
  ReminderPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  final items = List<String>.generate(10000, (i) => "Item $i");

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
            child: const Text('Edit'),
          ),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.redAccent),
            onPressed: () {},
            child: const Text('Delete'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
