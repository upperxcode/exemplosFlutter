import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalPoints;
  final Function restart;
  const Result({Key? key, required this.totalPoints, required this.restart}) : super(key: key);

  String get phraseResult {
    int comp = totalPoints;
    print(comp);
    if (comp < 8) {
      return 'Parabéns!';
    } else if (comp < 16) {
      return 'Você é bom!';
    } else if (comp < 25) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            phraseResult,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Colors.red[200],
            foregroundColor: Colors.black,
          ),
          onPressed: () => restart(),
          child: Text('Reiniciar Questionário'),
        ),
      ],
    );
  }
}
