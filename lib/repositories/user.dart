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
      await FirebaseFirestore.instance.collection('employers').add({
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
              .collection('admins')
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
              .collection('employer')
              .where('name', isEqualTo: userEmployer.name)
              .get();
      return querySnapshot.docs.first.data();
    } catch (e) {
      print(e);
      returnError(e.toString());
      return {};
    }
  }

  Future<bool> employerExist(
    UserEmployer userEmployer,
  ) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('employer')
              .where('name', isEqualTo: userEmployer.name)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> createEmployer(
    UserEmployer userEmployer,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('employers').add({
        "name": userEmployer.name,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> createOrNoEmployer(
    UserEmployer userEmployer,
  ) async {
    try {
      if (!(await employerExist(userEmployer))) {
        await createEmployer(userEmployer);
      }
    } catch (e) {
      print(e);
    }
  }
}
