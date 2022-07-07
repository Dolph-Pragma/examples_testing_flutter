import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubuser_withtest/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github User',
      initialRoute: 'welcome',
      routes: appRoutes,
    );
  }
}
