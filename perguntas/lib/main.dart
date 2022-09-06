import 'package:flutter/material.dart';
import 'app/buildquestion.dart';
import 'components/result.dart';
import 'app/question.dart';



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

  QuestionsMain quest = QuestionsMain();

  @override
  Widget build(BuildContext context) {
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
            ? BuildQuestion(quest.question(_perguntaSelecionada), quest.answers(_perguntaSelecionada), responder)
            : Result(
                totalPoints: pontuacaoTotal,
                restart: restartQuestions,
              ),
      ),
    );
  }
}
