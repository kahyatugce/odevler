import 'package:flutter/material.dart';
import 'package:intro_app/data/questions.dart';

void main() {
  runApp(const MaterialApp(home: QuizScreen()));
}

// boilerplate => basmakalıp
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // 1. gereksinim

  // 2. gereksinim
  // Hot Reload => Restarta gerek kalmadan (spesifik durumlar hariç)
  // değişikliklerin görünmesi.
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // asset
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 240,
            ),
            // Image.network(
            //     "https://miro.medium.com/v2/resize:fit:720/format:webp/1*FBRsnCP9wE84UVW1Kkv5Yw.jpeg"),
            const Text("Quiz App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, foregroundColor: Colors.black),
              child: const Text(
                "Oyuna Başla",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// SABIT UI

// StatefullWidget

// 2 class
// Widget - State
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizState();
  }
}

// _State

class _QuizState extends State<QuizScreen> {
  int soruIndex = 0;

  void sonrakiSoru() {
    if (soruIndex < questions.length - 1) {
      setState(() {
        soruIndex++;
      });
    } else {
      const Text(
        "***sorular bitti***",
        style: TextStyle(color: Colors.red, fontSize: 35),
      );
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[soruIndex].question),
            //değişkende tut
            ...questions[soruIndex].answers.map((answer) {
              return ElevatedButton(
                  onPressed: () {
                    sonrakiSoru();
                  },
                  child: Text(answer));
            })
          ],
        ),
      ),
    );
  }
}
