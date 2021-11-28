import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:remedy/Pages/medication_page.dart';

class MedicationDetailsPage extends StatefulWidget {
  MedicationDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MedicationDetailsPageState createState() => _MedicationDetailsPageState();
}

class _MedicationDetailsPageState extends State<MedicationDetailsPage> {
  String dosage = '';
  String amount = '';
  String dateDispensed = '';
  String expirationDate = '';
  String name = '';
  String frequency = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medications'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            getMedName(),
            const SizedBox(height: 30,),
            getDosage(),
            const SizedBox(height: 30,),
            getFrequency(),
            const SizedBox(height: 30,),
            getAmount(),
            const SizedBox(height: 30,),
            getDispensed(),
            const SizedBox(height: 30,),
            getExpiration(),
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
                          MedicationPage(title: 'Go'),
                    ));
                var timestamp = new DateTime.now().millisecondsSinceEpoch;
                FirebaseDatabase.instance.reference().child(
                    "Medication/med" + timestamp.toString()).set(
                  {
                    "Name" : name,
                    "Dosage": dosage,
                    "Frequency": frequency,
                    "Amount": amount,
                    "Date Dispensed": dateDispensed,
                    "Expiration Date": expirationDate
                  }
                ).then((value)
                {
                  print("success");
                }).catchError((error){
                  print("failure");
                });
                print('Name: ${name}');
                print('Dosage: ${dosage}');
                print('Frequency: ${frequency}');
                print('Amount: ${amount}');
                print('Date Dispensed: ${dateDispensed}');
                print('Expiration Date: ${expirationDate}');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMedName() => TextField(
        onChanged: (value) => setState(() => this.name = value),
        decoration: InputDecoration(
          labelText: 'Medication Name',
          hintText: 'Name',
          border: OutlineInputBorder(),
        ),
      );

  Widget getFrequency() => TextField(
    onChanged: (value) => setState(() => this.frequency = value),
    decoration: InputDecoration(
      labelText: 'Frequency',
      hintText: 'How many times a day? week?',
      border: OutlineInputBorder(),
    ),
  );

  Widget getDosage() => TextField(
    onChanged: (value) => setState(() => this.dosage = value),
    decoration: InputDecoration(
      labelText: 'Dosage',
      hintText: 'ex: 10 mg',
      border: OutlineInputBorder(),
    ),
  );

  Widget getAmount() => TextField(
    onChanged: (value) => setState(() => this.amount = value),
    decoration: InputDecoration(
      labelText: 'Amount',
      hintText: 'Number of Pills',
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
  );

  Widget getDispensed() => TextField(
    onChanged: (value) => setState(() => this.dateDispensed = value),
    decoration: InputDecoration(
      labelText: 'Date Dispensed',
      hintText: 'ex: 10/02/21',
      border: OutlineInputBorder(),
    ),
  );

  Widget getExpiration() => TextField(
    onChanged: (value) => setState(() => this.expirationDate = value),
    decoration: InputDecoration(
      labelText: 'Expiration Date',
      hintText: 'ex: 01/16/23',
      border: OutlineInputBorder(),
    ),
  );
}
