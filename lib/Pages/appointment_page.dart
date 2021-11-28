import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:remedy/InnerPages/appointment_details_page.dart';

class AppointmentPage extends StatefulWidget {
  AppointmentPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  var appointmentDetails = [];

  _AppointmentPageState()
  {
    FirebaseDatabase.instance.reference().child(
        "Appointment"
    ).once().then((datasnapshot)
    {
      print("success");
      //print(datasnapshot);
      //print(datasnapshot.key);
      //print(datasnapshot.value);
      var appsTemp =[];
      datasnapshot.value.forEach((k,v)
      {
        print(k);
        print(v);
        appsTemp.add(v);
      });
      print(appsTemp);
      appointmentDetails = appsTemp;
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
        title: Text('Appointments'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(primary: Colors.greenAccent),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(
          builder: (context) => AppointmentDetailsPage(title: 'AppDetials'),
        ));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: appointmentDetails.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(
                '${appointmentDetails[index] ['Nickname']}'
            ),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      'Date: ${appointmentDetails[index] ['Date']}'
                  ),
                  Text(
                      'Location: ${appointmentDetails[index] ['Location']}'
                  ),
                  Text(
                      'Physician: ${appointmentDetails[index] ['Physician']}'
                  ),
                  Text(
                      'Actual Time: ${appointmentDetails[index] ['Actual Time']}'
                  ),
                  Text(
                      'Reminder Set for: ${appointmentDetails[index] ['Reminder Time']}'
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
