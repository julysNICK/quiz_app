import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/User.dart';

class UserRepoService {
  static final UserRepoService _instance = UserRepoService._internal();

  factory UserRepoService() {
    return _instance;
  }

  UserRepoService._internal();

  String returnError(String error) {
    return error;
  }

  Future<void> createUserAdmin(
    UserAdmin userAdmin,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'email': userAdmin.email,
        'password': userAdmin.password,
      });
    } catch (e) {
      print(e);
      returnError(e.toString());
    }
  }

  Future<void> createUserEmployer(
    UserEmployer userEmployer,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': userEmployer.name,
      });
    } catch (e) {
      print(e);
      returnError(e.toString());
    }
  }

  Future<Map<String, dynamic>> getUserAdmin(
    UserAdmin userAdmin,
  ) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: userAdmin.email)
              .where('password', isEqualTo: userAdmin.password)
              .get();
      return querySnapshot.docs.first.data();
    } catch (e) {
      print(e);
      returnError(e.toString());
      return {};
    }
  }

  Future<Map<String, dynamic>> getUserEmployer(
    UserEmployer userEmployer,
  ) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('name', isEqualTo: userEmployer.name)
              .get();
      return querySnapshot.docs.first.data();
    } catch (e) {
      print(e);
      returnError(e.toString());
      return {};
    }
  }
}
