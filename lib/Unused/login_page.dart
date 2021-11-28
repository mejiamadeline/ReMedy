import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to ReMedy!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              'Login',
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
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 35, right: 35),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Text(
              '',
            ),
            Text(
              'Forgot Password?',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.redAccent
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
               child: const Text('Log In')
            ),
            Text(
              '',
            ),
            Text(
              "Don't have an account? Sign Up!",
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
