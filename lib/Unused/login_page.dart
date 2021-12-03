import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedy/Pages/home_page.dart';
import 'package:remedy/Pages/medication_page.dart';
import 'package:remedy/Unused/sign_up_page.dart';
import 'package:remedy/main.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In!'),
        centerTitle: true,
      ),

      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(50),
            children: [
              Text('Welcome to ReMedy',
                textAlign: TextAlign.center,
                textScaleFactor: 3.0,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const SizedBox(height: 30,),
              getEmail(),
              const SizedBox(height: 30,),
              getPassword(),
              const SizedBox(height: 30,),
              OutlinedButton(
                  onPressed: ()
                  {
                    auth.signInWithEmailAndPassword(
                        email: email,
                        password: password);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) =>
                            MyHomePage(title: 'Go')));
                    print(email);
                    print(password);
                  print('logged in');
                  },
                  child: const Text('Log In!')),
              const SizedBox(height: 30,),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignUpPage(title: 'sign')
                    )
                  );
                    },
                child: const Text('Don\'t have an account? Sign Up!')),
            ],
        ),
      ),
    );
  }
  Widget getEmail() => TextFormField(

    onChanged: (value) => setState(() => this.email = value),
    decoration: InputDecoration(
      labelText: 'Email Address',
      hintText: 'Ex: abcdelf@gmail.com',
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.emailAddress,
  );

  Widget getPassword() => TextFormField(
    onChanged: (value) => setState(() => this.password = value),
    decoration: InputDecoration(
      labelText: 'Password',
      hintText: 'Password',
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.visiblePassword,
  );
}
