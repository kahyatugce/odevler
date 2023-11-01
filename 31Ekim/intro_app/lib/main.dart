import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage("assets/lotus.jpg"),
                width: 200,
                height: 200,
              ),
            ),
            Text(
              "Tuğçe Kahya",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
            Text(
              "Tobeto - Mobil Geliştirme - 1B",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              "31.10.2023",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}
