import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Question.dart';
import '../repositories/forms.dart';
import '../screens/after_quiz/after_quiz_screen.dart';
import '../screens/thanks/thanks_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;

  QuestionRepo questionRepo = QuestionRepo();

  SubjectiveRepo subjectiveRepoObj = SubjectiveRepo();

  Animation? _animation;

  PageController get pageController => _pageController;
  PageController get pageControllerSub => _pageControllerSub;

  List<Map<String, dynamic>> list = [];

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

  final List<Question> _questions = sample_data
      .map((question) => Question(
            id: question.id,
            question: question.question,
            options: question.options,
            answer: question.answer,
            type: question.type,
          ))
      .toList();

  List<Question> get questions => _questions;

  final List<SubjectiveQuestion> _subjectiveQuestions = subjectiveQuestions
      .map((question) => SubjectiveQuestion(
            id: question.id,
            question: question.question,
          ))
      .toList();

  List<SubjectiveQuestion> get questionsSubjective => _subjectiveQuestions;

  final PageController _pageController = PageController();
  final PageController _pageControllerSub = PageController();

  final Map<String, int> counterAnswer = {
    'concordo': 0,
    'concordo_parcialmente': 0,
    'nao_concordo': 0,
    'nao_concordo_parcialmente': 0,
    'neutro': 0,
  };

  @override
  void dispose() {
    _animationController!.dispose();
    _pageController.dispose();
    _pageControllerSub.dispose();
    super.dispose();
  }

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
        counterAnswer['neutro'] = 1;
        questionRepo.neutral = counterAnswer['neutro'];
        break;
      case 3:
        counterAnswer['nao_concordo'] = 1;
        questionRepo.disagree = counterAnswer['nao_concordo'];
        break;
      case 4:
        counterAnswer['nao_concordo_parcialmente'] = 1;
        questionRepo.partiallyDisagree =
            counterAnswer['nao_concordo_parcialmente'];
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

  Future<void> postAnswerSubjectiveFireBase(
      SubjectiveRepo subjectiveRepo) async {
    try {
      subjectiveRepoObj = subjectiveRepo;

      await FormsRepoService().updateResultsSubjectiveForms(subjectiveRepoObj);
      subjectiveRepo.reset();
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> getAnswerSubjectiveFireBase() async {
    try {
      list = await FormsRepoService().getResultsSubjectiveForm();
      List formatList = list.map(
        (e) {
          return {
            'id': e['id'],
            'answers': e['answers'],
          };
        },
      ).toList();

      return formatList;
    } catch (e) {
      print(e);
      return [];
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

      return formatList..sort((a, b) => a['_id'].compareTo(b['_id'] ?? 0));
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

    if (question.id == 36) {
      Get.to(() => AfterQuiz());
    }
  }

  Future<void> checkAnsSub(SubjectiveRepo question) async {
    questionRepo.id = question.id;

    update();

    Future.delayed(const Duration(seconds: 1), () {
      _isAnswered = false;
      _pageControllerSub.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    });
    try {
      await postAnswerSubjectiveFireBase(question);
    } catch (e) {
      print(e);
    }

    if (question.id == 2) {
      Get.to(() => Thanks());
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
