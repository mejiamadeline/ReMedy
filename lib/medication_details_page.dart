import 'package:flutter/material.dart';

class MedicationDetailsPage extends StatefulWidget {
  MedicationDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MedicationDetailsPageState createState() => _MedicationDetailsPageState();
}

class _MedicationDetailsPageState extends State<MedicationDetailsPage> {
  final items = List<String>.generate(7, (i) => "info");
  /*List<String> details = [
    details(choice: dose),
    details(choice: frequency),
    details(choice: name),
    details(choice: strength),
    details(choice: amount),
    details(choice: datedespensed),
    details(choice: expirationdate),
  ];*/

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
