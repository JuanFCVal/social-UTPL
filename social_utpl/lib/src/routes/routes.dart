import 'package:flutter/material.dart';
import 'package:social_utpl/src/screens/construction.dart';
import 'package:social_utpl/src/screens/home.dart';
import 'package:social_utpl/src/screens/login_screen.dart';
import 'package:social_utpl/src/screens/register_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginScreen(),
    'home': (BuildContext context) => HomeScreen(),
    'register': (BuildContext context) => RegisterPage(),
    '404 ': (BuildContext context) => UnderConstruction(),
  };
}
