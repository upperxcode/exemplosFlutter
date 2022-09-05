import 'package:aula1/components/answer.dart';
import 'package:aula1/components/question.dart';
import 'package:aula1/components/result.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaAppState createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  bool terminou = false;
  int pontuacaoTotal = 0;

  void responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      pontuacaoTotal += pontuacao;
      print('pergunta respondida pontuação $pontuacaoTotal');
      if (_perguntaSelecionada > 2) {
        _perguntaSelecionada = 0;
        terminou = true;
      }
    });
  }

  void restartQuestions() {
    setState(() {
      pontuacaoTotal = 0;
      _perguntaSelecionada = 0;
      terminou = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> questions = [
      {
        'text': 'Qual a sua cor favorita?',
        'answer': [
          {'nome': 'preta', 'nota': 5},
          {'nome': 'azul', 'nota': 6},
          {'nome': 'branca', 'nota': 7},
          {'nome': 'amarela', 'nota': 7},
        ],
      },
      {
        'text': 'Qual o seu animal favorito?',
        'answer': [
          {'nome': 'cachorro', 'nota': 10},
          {'nome': 'gato', 'nota': 10},
          {'nome': 'macaco', 'nota': 5},
          {'nome': 'cobra', 'nota': 2},
        ],
      },
      {
        'text': 'Qual a sua comida favorita?',
        'answer': [
          {'nome': 'lasanha', 'nota': 8},
          {'nome': 'feijoada', 'nota': 10},
          {'nome': 'macarronada', 'nota': 6},
          {'nome': 'churrasco', 'nota': 10},
        ],
      },
    ];

    List<Map<String, dynamic>> answers = questions[_perguntaSelecionada]['answer'];

    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: Colors.lightBlue[800],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: !terminou
            ? buidQuestions(questions[_perguntaSelecionada]['text'].toString(), answers, responder)
            : Result(
                totalPoints: pontuacaoTotal,
                restart: restartQuestions,
              ),
      ),
    );
  }
}

Widget buidQuestions(String pergunta, List list, Function responder) {
  return Wrap(
    spacing: 20,
    runSpacing: 20,
    children: [
      Question(pergunta),
      ...list
          .map((t) => Answer(
                text: t['nome'],
                func: responder,
                pontuacao: t['nota'],
              ))
          .toList(),
    ],
  );
}
