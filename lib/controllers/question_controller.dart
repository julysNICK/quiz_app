import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Question.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
//animate progressbar based on answered questions
  AnimationController? _animationController;
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
        counterAnswer['concordo'] = counterAnswer['concordo']! + 1;
        break;
      case 1:
        counterAnswer['concordo_parcialmente'] =
            counterAnswer['concordo_parcialmente']! + 1;
        break;
      case 2:
        counterAnswer['nao_concordo'] = counterAnswer['nao_concordo']! + 1;
        break;
      case 3:
        counterAnswer['nao_concordo_parcialmente'] =
            counterAnswer['nao_concordo_parcialmente']! + 1;
        break;
      case 4:
        counterAnswer['neutro'] = counterAnswer['neutro']! + 1;
        break;
    }

    update();
  }

  void checkAns(Question question, int selectedAns) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedAns;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    updateCounterAnswer(selectedAns);
    update();
    Future.delayed(const Duration(seconds: 1), () {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    });
  }

  void PreviousQuestion() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
