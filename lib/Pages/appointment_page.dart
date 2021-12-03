import 'package:firebase_auth/firebase_auth.dart';
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

  final DatabaseReference ref =
  FirebaseDatabase.instance.reference().child("users");
  final FirebaseAuth auth = FirebaseAuth.instance;


  var appointmentDetails = [];
  var appId = [];
  var selected;

  void setInfo() async
  {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    FirebaseDatabase.instance.reference().child(
        "users/$uid/Appointment"
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
        appId.add(k);
        appsTemp.add(v);
      });
      print(appId);
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
          IconButton(
            onPressed: (){
              setInfo();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(
              context,
              MaterialPageRoute(
          builder: (context) =>
              AppointmentDetailsPage(title: 'AppDetials'),
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
                    print("Deleted ID is: " + appId[index]);
                    selected = appId[index];
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
                      'Date: ${appointmentDetails[index] ['Date']}'
                  ),
                  Text(
                      'Location: ${appointmentDetails[index] ['Location']}'
                  ),
                  Text(
                      'Physician: ${appointmentDetails[index] ['Physician']}'
                  ),
                  Text(
                      'Appointment Time: ${appointmentDetails[index] ['Actual Time']}'
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
        "users/$uid/Appointment").child(selected).remove();
    selected = null;
  }
}
