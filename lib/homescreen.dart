import 'package:flutter/material.dart';
import 'studymaterial.dart';
import 'matching.dart';
import 'memory.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userName = 'XYZ';

  @override
  Widget build(BuildContext context) {
    final chapter = ModalRoute.of(context)?.settings.arguments ?? 1;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the main menu
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('/Users/krishna/AndroidStudioProjects/minglemath/assets/NoPic.png'),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Welcome $userName',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'C H A P T E R   $chapter   M E N U ',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/studymaterial', arguments: chapter);
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.pink,
                      //onPrimary: Colors.white,
                      minimumSize: Size(900, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white, width: 10),
                      ),
                    ),
                    child: Text(
                      'unlock the Magic of Learning'.toUpperCase(),
                      style: TextStyle(fontSize: 45,color: Colors.brown),
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/matching', arguments: chapter);
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.green,
                      //onPrimary: Colors.white,
                      minimumSize: Size(900, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white, width: 10),
                      ),
                    ),
                    child: Text(
                      'Jungle Matching Safari'.toUpperCase(),
                      style: TextStyle(fontSize: 45,color: Colors.brown),
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/memory', arguments: chapter);
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.orange,
                      //onPrimary: Colors.white,
                      minimumSize: Size(900, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white, width: 10),
                      ),
                    ),
                    child: Text(
                      'Remember & Win'.toUpperCase(),
                      style: TextStyle(fontSize: 45,color: Colors.brown),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}