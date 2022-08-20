
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:your_app_name/core/dependencies/bloc_provider.dart';
import 'package:your_app_name/presentation/helper/route_generator.dart';

import 'core/local/cache_helper.dart';
import 'presentation/resources/app_routes.dart';
import 'presentation/resources/theme_manager.dart';


void main() async {
  // inialize object before calling [runApp].
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init(); //localStorage

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppMainProvider(
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          // darkTheme: getAppDarkTheme(),
          theme: getAppLightTheme(),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: CacheHelper.getData(key: "userName")!=null?Routes.verifyRoute:Routes.loginRoute,
        ));
  }
}
