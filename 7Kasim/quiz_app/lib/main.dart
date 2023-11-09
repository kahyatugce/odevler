import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  void startQuiz(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Questions_Screen(),
      ),
    );
  }

  Color mainColor = Color(0xFFBFA7A7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/logo.jpg",
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Questions_Screen()));
              },
              elevation: 0,
              color: Colors.pink,
              textColor: Colors.white,
              child: const Text(
                "Start Quiz",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
