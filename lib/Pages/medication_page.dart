import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:remedy/InnerPages/medication_details_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MedicationPage extends StatefulWidget {
  MedicationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {

  var medicationDetails = [];
  var medId = [];
  var selected;
  final DatabaseReference ref =
  FirebaseDatabase.instance.reference().child("users");
  final FirebaseAuth auth = FirebaseAuth.instance;

  void setInfo() async{
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    FirebaseDatabase.instance.reference().child(
        "users/$uid/Medication"
    ).once().then((datasnapshot) {
      print("success");
      //print(datasnapshot);
      //print(datasnapshot.key);
      //print(datasnapshot.value);
      var medsTemp = [];
      datasnapshot.value.forEach((k, v) {
        //print("Key: " + k);
        //print(v);
        medId.add(k);
        medsTemp.add(v);
      });
      print(medId);
      print(medsTemp);
      medicationDetails = medsTemp;
      setState(() {});
    }).catchError((error) {
      print("failure");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medications'),
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
                builder: (context) =>
                    MedicationDetailsPage(title: 'MedDetails'),
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
            trailing: Wrap(
              spacing: 200,
              children: <Widget>[

                Icon(Icons.arrow_drop_down_rounded,
                  color: Colors.grey,
                ),
                IconButton(
                  icon: Icon(Icons.delete,
                    color: Colors.red,),
                  onPressed: () {
                    print("Deleted ID is: " + medId[index]);
                    selected = medId[index];
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

  deletes(var selected) async
  {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    await FirebaseDatabase.instance.reference().child(
        "users/$uid/Medication").child(selected).remove();
    selected = null;
  }
}


