import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Question.dart';

class FormsRepoService {
  static final FormsRepoService _instance = FormsRepoService._internal();

  factory FormsRepoService() {
    return _instance;
  }

  FormsRepoService._internal();

  String returnError(String error) {
    return error;
  }

  Future<void> createResultsForm(
    QuestionRepo questionRepo,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('forms').add({
        '_id': questionRepo.id,
        'concordo': questionRepo.agree,
        'concordo_parcialmente': questionRepo.partiallyAgree,
        'nao_concordo': questionRepo.disagree,
        'nao_concordo_parcialmente': questionRepo.partiallyDisagree,
        'neutro': questionRepo.neutral,
      });
    } catch (e) {
      print(e);
      returnError(e.toString());
    }
  }

  Future<void> createResultsSubjectiveForm(
    SubjectiveRepo subjectiveRepo,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('forms_subjective_answer')
          .add({
        'answer': subjectiveRepo.answer,
      });
    } catch (e) {
      print(e);
      returnError(e.toString());
    }
  }

  Future<bool> verifyIfIdExists(
    QuestionRepo questionRepo,
  ) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('forms')
              .where('_id', isEqualTo: questionRepo.id)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      returnError(e.toString());
      return false;
    }
  }

  Future<dynamic> getResultsFormById(
    QuestionRepo questionRepo,
  ) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('forms')
              .where('_id', isEqualTo: questionRepo.id)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      returnError(e.toString());
      return null;
    }
  }

  Future updateResutsForms(QuestionRepo question) async {
    try {
      if (await verifyIfIdExists(question)) {
        dynamic result = await getResultsFormById(question);

        await FirebaseFirestore.instance
            .collection('forms')
            .doc('${result.id}')
            .update({
          'concordo': result.data()['concordo'] + question.agree,
          'concordo_parcialmente':
              result.data()['concordo_parcialmente'] + question.partiallyAgree,
          'nao_concordo': result.data()['nao_concordo'] + question.disagree,
          'nao_concordo_parcialmente':
              result.data()['nao_concordo_parcialmente'] +
                  question.partiallyDisagree,
          'neutro': result.data()['neutro'] + question.neutral,
        });
      } else {
        await createResultsForm(question);
      }
    } catch (e) {
      print(e);
      returnError(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getResultsForm() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('forms').get();

      List<Map<String, dynamic>> list = [];

      for (var element in querySnapshot.docs) {
        list.add(element.data());
      }

      return list;
    } catch (e) {
      print(e);
      returnError(e.toString());
    }
    return [];
  }
}
