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

  Future<List<Map<String, dynamic>>> getResultsForm() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('forms')
              .orderBy('_id')
              .get();

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
