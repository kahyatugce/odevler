import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bubble extends StatelessWidget {
  final String message;
  const Bubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.pink),
      child: Text(
        message,
        style: TextStyle(
            fontSize: 16, color: Colors.brown, fontWeight: FontWeight.bold),
      ),
    );
  }
}
