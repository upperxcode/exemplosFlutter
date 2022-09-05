import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function func;
  final int pontuacao;
  const Answer({Key? key, required this.text, required this.func, required this.pontuacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () => {func(pontuacao)},
      child: Text(text),
    );
  }
}
