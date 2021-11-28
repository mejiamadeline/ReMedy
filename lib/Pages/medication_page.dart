import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:remedy/InnerPages/medication_details_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MedicationPage extends StatefulWidget {
  MedicationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {

  var medicationDetails = [];

  _MedicationPageState()
  {
    FirebaseDatabase.instance.reference().child(
        "Medication"
    ).once().then((datasnapshot)
    {
      print("success");
      //print(datasnapshot);
      //print(datasnapshot.key);
      //print(datasnapshot.value);
      var medsTemp =[];
      datasnapshot.value.forEach((k,v)
      {
        print(k);
        print(v);
        medsTemp.add(v);
      });
      print(medsTemp);
      medicationDetails = medsTemp;
      setState(() {
      });
    }).catchError((error)
    {
      print("failure");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medications'),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MedicationDetailsPage(title: 'MedDetials'),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: medicationDetails.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
              title: Text(
                  '${medicationDetails[index] ['Name']}'
              ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Dosage: ${medicationDetails[index] ['Dosage']}'
                ),
                Text(
                    'Frequency: ${medicationDetails[index] ['Frequency']}'
                ),
                Text(
                    'Amount: ${medicationDetails[index] ['Amount']}'
                ),
                Text(
                    'Date Dispensed: ${medicationDetails[index] ['Date Dispensed']}'
                ),
                Text(
                    'Expiration Date: ${medicationDetails[index] ['Expiration Date']}'
                ),
              ],
            )
          ],
          );
        },
      ),
    );
  }
}

