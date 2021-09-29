import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';
import 'package:supercines/screens/home_screen.dart';
import 'package:supercines/screens/tickets_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supercines',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          accentColor: yellow,
          textTheme: TextTheme(
              headline1: TextStyle(
            fontSize: 25.0,
            color: yellow,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ))),
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => HomeScreen(),
        '/tickets': (BuildContext context) => TicketsScreen(),
      },
    );
  }
}
