import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';
import 'package:supercines/screens/home_screen.dart';
import 'package:supercines/screens/tickets_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supercines',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: const TextTheme(
              headline1: TextStyle(
            fontSize: 25,
            color: yellow,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          )),
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: yellow)),
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => const HomeScreen(),
        '/tickets': (BuildContext context) => const TicketsScreen(),
      },
    );
  }
}
