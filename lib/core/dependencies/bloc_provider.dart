import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/core/logic/auth_provider.dart';
import 'package:your_app_name/core/logic/home_provider.dart';

class AppMainProvider extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AppMainProvider({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: child!,
    );
  }
}
