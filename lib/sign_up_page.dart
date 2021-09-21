import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 35, right: 35),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 35, right: 35),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 35, right: 35),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 35, right: 35),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            Text(
              '',
            ),
            OutlinedButton(
                onPressed: (){
                  print('Logged in');
                },
                style: ButtonStyle(
                ),
                child: const Text('Sign Up')
            ),
            Text(
              '',
            ),
            Text(
              'Already have an account? Login!',
              textAlign: TextAlign.right,
            ),
          ],
        ),

      ),
    );
  }
}
