import 'package:flutter/material.dart';

import 'home.dart';
import 'loginpage.dart';
import 'signuppage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
    primaryColor: Colors.green,
    accentColor: Colors.grey,
      ),
      routes: <String , WidgetBuilder>{
          '/landingpage ':(BuildContext context) => new MyApp(),
          '/signup': (BuildContext context) => new SignUpPage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/loginpage': (BuildContext context) => new LoginPage(),

      },
       );
  }
}
