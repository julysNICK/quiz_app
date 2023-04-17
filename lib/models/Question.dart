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

final List sample_data = [
  Question(
      id: 1,
      question: "What's your favorite color?",
      options: ["Black", "Red", "Green", "Blue"],
      answer: 1),
  Question(
      id: 2,
      question: "What's your favorite animal?",
      options: ["Rabbit", "Snake", "Elephant", "Lion"],
      answer: 4),
  Question(
      id: 3,
      question: "Who's your favorite instructor?",
      options: ["Max", "Max", "Max", "Max"],
      answer: 1),
  Question(
      id: 4,
      question: "What's your favorite instructor?",
      options: ["Max", "Max", "Max", "Max"],
      answer: 1),
  Question(
      id: 5,
      question: "What's your favorite instructor?",
      options: ["Max", "Max", "Max", "Max"],
      answer: 1),
];
