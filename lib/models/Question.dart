class Question {
  int id = 0, answer = 0;
  String question = '';
  List<String> options = [];
  String type = 'objective';

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
    this.type = 'objective',
  });
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

class SubjectiveRepo {
  int id = 0;
  String answer = '';

  SubjectiveRepo({
    this.answer = '',
    this.id = 0,
  });

  void reset() {
    answer = '';
  }
}

class SubjectiveQuestion {
  int id = 0;
  String question = '';

  SubjectiveQuestion({
    this.question = '',
    this.id = 0,
  });

  void reset() {
    question = '';
  }
}

List<SubjectiveQuestion> subjectiveQuestions = [
  SubjectiveQuestion(
    id: 1,
    question: "Como você percebe o ambiente externo da empresa?",
  ),
  SubjectiveQuestion(
    id: 2,
    question:
        "Você tem alguma sugestão ou comentário para melhorar o clima organizacional na empresa?",
  )
];

final List<Question> sample_data = [
  Question(
      id: 1,
      question: "Em geral, você está satisfeito em relação ao seu trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
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
      ],
      answer: 2),
  Question(
      id: 6,
      question:
          "Você tem acesso às informações necessárias para realizar seu trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 7,
      question:
          "Você se sente confortável para expressar suas ideias e opiniões no ambiente de trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 8,
      question:
          "Você se sente confortável para expressar suas ideias e opiniões no ambiente de trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 9,
      question: "A empresa ouve e responde às suas sugestões e comentários?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 10,
      question:
          "Você acredita que seus superiores são competentes e capazes de liderar a equipe?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 11,
      question: "Eles fornecem orientação e apoio quando necessário?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 12,
      question: "Eles se preocupam com o bem-estar dos funcionários?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 13,
      question: "Eles promovem um ambiente de trabalho justo e igualitário?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 14,
      question: "Você acha que o ambiente de trabalho é confortável e seguro?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 15,
      question: "O ambiente de trabalho é limpo e bem organizado?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 16,
      question:
          "A empresa promove um ambiente de trabalho diverso e inclusivo?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 17,
      question:
          "A empresa investe em recursos e equipamentos necessários para o seu trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 18,
      question:
          "A empresa oferece oportunidades de aprendizado e desenvolvimento profissional?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 19,
      question:
          "Você se sente apoiado pela empresa em seu desenvolvimento profissional?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 20,
      question: "A empresa oferece oportunidades de crescimento e promoção?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 21,
      question:
          "Você acredita que a empresa valoriza e recompensa o desempenho excepcional?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 22,
      question: "Você se identifica com os valores e missão da empresa?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 23,
      question:
          "A empresa promove um ambiente de trabalho colaborativo e de equipe?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 24,
      question: "A empresa promove a diversidade e inclusão?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 25,
      question:
          "A empresa é socialmente responsável e engajada com a comunidade?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 26,
      question:
          "Você acha que sua remuneração é justa em relação às suas responsabilidades e desempenho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 27,
      question:
          "A empresa oferece benefícios suficientes para atender às suas necessidades?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 28,
      question: "Você acha que a empresa valoriza o seu trabalho e esforço?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 29,
      question: "Você se sente recompensado pelos resultados alcançados?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 30,
      question:
          "A empresa tem processos claros e eficientes para realizar o trabalho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 31,
      question:
          "Os procedimentos e políticas são justos e aplicados de forma consistente?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 32,
      question: "A empresa está aberta a mudanças e inovações?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 33,
      question:
          "A empresa promove a melhoria contínua dos processos e do desempenho?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 34,
      question: "Você acredita que a empresa está bem posicionada no mercado?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 35,
      question: "A empresa está atenta às tendências e mudanças do mercado?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
  Question(
      id: 36,
      question: "A empresa é vista como uma referência no setor em que atua?",
      options: [
        "Concordo",
        "Concordo parcialmente",
        "Não concordo ",
        "Não concordo parcialmente",
      ],
      answer: 2),
];
