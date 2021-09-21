import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home Page',
            ),
            Text(
              'Navigation Bar at the bottom(below)',
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    iconSize: 75,
                    icon: Image.network(
                        'https://cdn4.iconfinder.com/data/icons/eldorado-medicine/40/pill_drugs-512.png')),
                IconButton(
                    onPressed: () {},
                    iconSize: 75,
                    icon: Image.network(
                        'https://cdn.iconscout.com/icon/free/png-256/calendar-3200778-2683078.png')),
              IconButton(
                  onPressed: (){},
                  iconSize: 75,
                  icon: Image.network('https://cdn-icons-png.flaticon.com/512/1792/1792756.png')),
              IconButton(
                  onPressed: (){},
                  iconSize: 75,
                  icon: Image.network('https://static.thenounproject.com/png/1072809-200.png'))
              ],
            ),
            /* bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon:Icon(Icons.home),
                  label: 'Home',
                  ),
                ],
            ),*/
          ],
        ),
      ),
    );
  }
}
