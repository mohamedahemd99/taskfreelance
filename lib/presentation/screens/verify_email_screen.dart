import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  @override
  void dispose() {
    Provider.of<HomeProvider>(context, listen: false).timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).initVerify();

    super.initState();
    // Provider.of<HomeProvider>(context, listen: false).isEmailVerified =
    //     FirebaseAuth.instance.currentUser!.emailVerified;
    if (!Provider.of<HomeProvider>(context,listen: false).isEmailVerified) {
      print(Provider.of<HomeProvider>(context,listen: false).isEmailVerified);
      Provider.of<HomeProvider>(context, listen: false)
          .sendEmailVerification(context);
      Provider.of<HomeProvider>(context,listen: false).timer = Timer.periodic(
          Duration(seconds: 3),
          (_) => Provider.of<HomeProvider>(context, listen: false)
              .checkEmailVerification());
    }
  }

  @override
  Widget build(BuildContext context) => Provider.of<HomeProvider>(context)
          .isEmailVerified
      ? const HomeScreen()
      : Scaffold(
          appBar: AppBar(
            title: const AppText(text: "Verify Email"),
          ),
          body: AppPadding(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const AppText(
                text: "A verification email has been sent to your email",
              ),
              const SizedBox(
                height: 24,
              ),
              AppButton(
                onTap: () =>
                    Provider.of<HomeProvider>(context).cancelResentEmail
                        ? Provider.of<HomeProvider>(context, listen: false)
                            .sendEmailVerification(context)
                        : null,
                translation: "Resent Email",
                color: Colors.teal,
              )
            ]),
          ),
        );
}
