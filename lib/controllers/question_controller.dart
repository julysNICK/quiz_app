import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Question.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Question> _questions = sample_data
      .map((question) => Question(
          id: question.id,
          question: question.question,
          options: question.options,
          answer: question.answer))
      .toList();

  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  List<Question> get questions => _questions;
  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;
  int _correctAns = 0;

  int get correctAns => _correctAns;

  int _selectedAns = -1;

  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;

  void checkAns(Question question, int selectedAns) {
    _isAnswered = true;

    _correctAns = question.answer;
    _selectedAns = selectedAns;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

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
