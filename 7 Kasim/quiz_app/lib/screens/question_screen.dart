import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:quiz_app/screens/result_screen.dart';

class Questions_Screen extends StatefulWidget {
  const Questions_Screen({super.key});

  @override
  State<Questions_Screen> createState() => _Questions_ScreenState();
}

class _Questions_ScreenState extends State<Questions_Screen> {
  Color mainColor = Color(0xFFBFA7A7);
  Color secondColor = Colors.white;
  PageController? _controller = PageController(initialPage: 0);

  bool isPressed = false;
  Color isTrue = Colors.green.shade200;
  Color isWrong = Colors.red.shade700;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${index + 1} /${questions.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 32.0,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  questions[index].question!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < questions[index].answer!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      color: isPressed
                          ? questions[index].answer!.entries.toList()[i].value
                              ? isTrue
                              : isWrong
                          : secondColor,
                      padding: EdgeInsets.all(10),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answer!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                              }
                            },
                      child: Text(
                        questions[index].answer!.keys.toList()[i],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResultScreen(score)));
                                }
                              : () {
                                  _controller!.nextPage(
                                      duration: Duration(milliseconds: 50),
                                      curve: Curves.linear);
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side:
                            BorderSide(color: Colors.pink.shade400, width: 3.0),
                      ),
                      child: Text(
                        index + 1 == questions.length
                            ? "See Result"
                            : "Next Question",
                        style: TextStyle(
                            color: Colors.indigo.shade900, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
