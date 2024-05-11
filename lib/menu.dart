import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'matching.dart';
import 'memory.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: Menu(),
  ));
}

class Menu extends StatelessWidget {
  // Customize the spacing between each option
  final double buttonSpacing = 20.0;

  @override
  Widget build(BuildContext context) {
    int? total = Provider.of<GameData>(context).total;
    int? total1 = Provider.of<GameData1>(context).total;
    int? GT = total + total1;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/Users/krishna/AndroidStudioProjects/minglemath/assets/menu.jpeg'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the total value in a styled card
              Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'T O T A L : $GT',
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: buttonSpacing * 0.5), // Adjusted spacing
              // Row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildChapterButton(context, 'C H A P T E R   1', 1, Colors.pinkAccent),
                  SizedBox(width: buttonSpacing),
                  buildChapterButton(context, 'C H A P T E R   2', 2, Colors.green),
                  SizedBox(width: buttonSpacing),
                  buildChapterButton(context, 'C H A P T E R   3', 3, Colors.orangeAccent),
                ],
              ),
              SizedBox(height: buttonSpacing), // Spacing between rows
              // Row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildChapterButton(context, 'C H A P T E R   4', 4, Colors.deepPurpleAccent),
                  SizedBox(width: buttonSpacing),
                  buildChapterButton(context, 'C H A P T E R   5', 5, Colors.redAccent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChapterButton(BuildContext context, String title, int chapterNumber, Color color) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(300, 120), // Adjust the button width as needed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(150),
            side: BorderSide(color: Colors.white, width: 10),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/home', arguments: chapterNumber);
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 27),
        ),
      ),
    );
  }
}
