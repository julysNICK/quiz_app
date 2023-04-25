import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Question.dart';
import '../repositories/forms.dart';
import '../screens/after_quiz/after_quiz_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
//animate progressbar based on answered questions
  AnimationController? _animationController;
  QuestionRepo questionRepo = QuestionRepo();
  Animation? _animation;

  Animation get animation => _animation!;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        update();
      });
    _animationController!.forward();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController!.dispose();
    super.onClose();
  }

  final List<Question> _questions = sample_data
      .map((question) => Question(
          id: question.id,
          question: question.question,
          options: question.options,
          answer: question.answer))
      .toList();

  final PageController _pageController = PageController();

  final Map<String, int> counterAnswer = {
    'concordo': 0,
    'concordo_parcialmente': 0,
    'nao_concordo': 0,
    'nao_concordo_parcialmente': 0,
    'neutro': 0,
  };

  PageController get pageController => _pageController;
  List<Map<String, dynamic>> list = [];
  Map<String, dynamic> resultList = {};
  List<dynamic> newList = [];
  List<Question> get questions => _questions;
  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;
  int _correctAns = 0;

  int get correctAns => _correctAns;

  int _selectedAns = -1;

  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;

  int get questionNumberInt => _questionNumber.value;

  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;

  void updateCounterAnswer(int index) {
    switch (index) {
      case 0:
        counterAnswer['concordo'] = 1;
        questionRepo.agree = counterAnswer['concordo'];
        break;
      case 1:
        counterAnswer['concordo_parcialmente'] = 1;
        questionRepo.partiallyAgree = counterAnswer['concordo_parcialmente'];
        break;
      case 2:
        counterAnswer['nao_concordo'] = 1;
        questionRepo.disagree = counterAnswer['nao_concordo'];
        break;
      case 3:
        counterAnswer['nao_concordo_parcialmente'] = 1;
        questionRepo.partiallyDisagree =
            counterAnswer['nao_concordo_parcialmente'];
        break;
      case 4:
        counterAnswer['neutro'] = 1;
        questionRepo.neutral = counterAnswer['neutro'];
        break;
    }

    update();
  }

  Future<void> postAnswerFireBase() async {
    try {
      await FormsRepoService().updateResutsForms(questionRepo);
      questionRepo.reset();
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> getAnswerFireBase() async {
    try {
      list = await FormsRepoService().getResultsForm();
      //format List

      List formatList = list.map(
        (e) {
          return {
            '_id': e['_id'],
            'concordo': e['concordo'],
            'concordo_parcialmente': e['concordo_parcialmente'],
            'nao_concordo': e['nao_concordo'],
            'nao_concordo_parcialmente': e['nao_concordo_parcialmente'],
            'neutro': e['neutro'],
          };
        },
      ).toList();

      return formatList..sort((a, b) => a['_id'].compareTo(b['_id']));
    } catch (e) {
      print(e);
      return [];
    }
  }

  void checkAns(Question question, int selectedAns) async {
    _isAnswered = true;
    _correctAns = question.answer;
    questionRepo.id = question.id;
    _selectedAns = selectedAns;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    updateCounterAnswer(selectedAns);
    update();
    print(question.id);
    Future.delayed(const Duration(seconds: 1), () {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    });

    try {
      await postAnswerFireBase();
    } catch (e) {
      print(e);
    }

    if (question.id == 8) {
      Get.to(() => const AfterQuiz());
    }
  }

  void PreviousQuestion() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
