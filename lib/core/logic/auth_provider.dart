import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/core/local/cache_helper.dart';
import 'package:your_app_name/core/logic/home_provider.dart';
import 'package:your_app_name/presentation/screens/login_screen.dart';
import 'package:your_app_name/presentation/screens/verify_email_screen.dart';

import '../utilities/firebase_service.dart';


class AuthProvider with ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //create  user with email and password//
  void defaultRegister(
      {required String email,
      required String password,
      required String userName,
      required context}) async {
    await Auth().createUser(email, password).then((user) async {
      CacheHelper.putData(key: "userName", value:userName);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) =>  VerifyScreen(),
          ),
              (Route<dynamic> route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            user.email.toString(),
          ),
        ),
      );

      notifyListeners();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
      print(error);
      notifyListeners();
    });
  }

  void defaultLogin(
      {required String email, required String password, required context}) {
    Auth().signIn(email, password).then((value) async {}).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
      print(error);
      notifyListeners();
    });
  }

  void logout({required context}) async {
    await Auth().signOut().then((value) {
      CacheHelper.deleteData(key: "userName");

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) =>  LoginScreen(),
          ),
          (Route<dynamic> route) => false);
      notifyListeners();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
      print(error);
      notifyListeners();
    });
  }
}
