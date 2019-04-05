import 'package:flutter/material.dart';

class WeaponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text("In order to view this page\nYou must purchase\nthe 'Uranus DLC'\nNow on sale for only 399.-",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 22
            ),
          ),
        ),
      ),
    );
  }
}
