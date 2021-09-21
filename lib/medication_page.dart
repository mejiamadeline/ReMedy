import 'package:flutter/material.dart';

class MedicationPage extends StatefulWidget {
  MedicationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  final items = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medications'),
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
