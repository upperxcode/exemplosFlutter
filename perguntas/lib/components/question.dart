import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;

  const Question(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            //height: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Text(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
              ),
              text,
            ),
          ),
        )
      ],
    );
  }
}
