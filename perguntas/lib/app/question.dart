class QuestionsMain {
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
        {'nome': 'lasanha', 'nota': 9},
        {'nome': 'feijoada', 'nota': 10},
        {'nome': 'macarronada', 'nota': 6},
        {'nome': 'churrasco', 'nota': 10},
      ],
    },
  ];

  String question(int index) => questions[index]['text'].toString();

  List<Map<String, dynamic>> answers(int pergunta) => questions[pergunta]['answer'];
}
