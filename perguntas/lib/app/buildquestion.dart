import 'package:flutter/material.dart';

import '../components/answer.dart';
import '../components/question.dart';

class BuildQuestion extends StatelessWidget {
  final String pergunta;
  final List list;
  final Function answer;

  const BuildQuestion(this.pergunta, this.list, this.answer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        Question(pergunta),
        ...list
            .map((t) => Answer(
                  text: t['nome'],
                  func: answer,
                  pontuacao: t['nota'],
                ))
            .toList(),
      ],
    );
  }
}
