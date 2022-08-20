import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:your_app_name/core/logic/home_provider.dart';
import 'package:your_app_name/presentation/screens/home_screen.dart';
import 'package:your_app_name/presentation/widgets/app_button.dart';
import 'package:your_app_name/presentation/widgets/app_padding.dart';
import 'package:your_app_name/presentation/widgets/app_text_display.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool isEmailVerified = false;
  bool cancelResentEmail = false;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {

    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      print(isEmailVerified);
      sendEmailVerification();
      timer =
          Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerification());
    }
  }

  Future checkEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(()=>cancelResentEmail=false);

      await Future.delayed(Duration(seconds: 5));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
           "check your mail",
          ),
        ),
      );
      setState(()=>cancelResentEmail=true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomeScreen()
      : Scaffold(
          appBar: AppBar(
            title: const AppText(text: "Verify Email"),
          ),
          body: AppPadding(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center, children: [
                  const AppText(text: "A verification email has been sent to your email",),
              const SizedBox(height: 24,),
              AppButton(
                onTap:()=>cancelResentEmail?sendEmailVerification():null ,
                translation: "Resent Email",
                color: Colors.teal,
              )
            ]),
          ),
        );
}
