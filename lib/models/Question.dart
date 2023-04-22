class Question {
  int id = 0, answer = 0;
  String question = '';
  List<String> options = [];

  Question(
      {required this.id,
      required this.question,
      required this.options,
      required this.answer});
}

class QuestionRepo {
  int? id = 0;
  int? agree = 0;
  int? partiallyAgree = 0;
  int? disagree = 0;
  int? partiallyDisagree = 0;
  int? neutral = 0;

  QuestionRepo({
    this.id = 0,
    this.agree = 0,
    this.partiallyAgree = 0,
    this.disagree = 0,
    this.partiallyDisagree = 0,
    this.neutral = 0,
  });

  void reset() {
    agree = 0;
    partiallyAgree = 0;
    disagree = 0;
    partiallyDisagree = 0;
    neutral = 0;
  }
}

final List<Question> sample_data = [
  Question(
      id: 1,
      question: "Em geral, como você se sente em relação ao seu trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
        "Neutro"
      ],
      answer: 1),
  Question(
      id: 2,
      question: "Você se sente valorizado e reconhecido pela empresa?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
        "Neutro"
      ],
      answer: 1),
  Question(
      id: 3,
      question: "Você se sente motivado para realizar suas tarefas diárias?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
        "Neutro"
      ],
      answer: 2),
  Question(
      id: 4,
      question: "Você se sente confiante em relação ao seu futuro na empresa?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
        "Neutro"
      ],
      answer: 2),
  Question(
      id: 5,
      question:
          "Você acha que as informações importantes são comunicadas de forma clara e eficaz?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
        "Neutro"
      ],
      answer: 2),
  Question(
      id: 6,
      question:
          "Você acha que as informações importantes são comunicadas de forma clara e eficaz?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
        "Neutro"
      ],
      answer: 2),
  Question(
      id: 7,
      question:
          "Você tem acesso às informações necessárias para realizar seu trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
        "Neutro"
      ],
      answer: 2),
  Question(
      id: 8,
      question:
          " Você se sente confortável para expressar suas ideias e opiniões no ambiente de trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
        "Neutro"
      ],
      answer: 2),
];
