import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';
import 'package:supercines/screens/home_screen.dart';
import 'package:supercines/screens/tickets_screen.dart';

void main2() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
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

abstract class Transmission {
  final int velocities;

  Transmission(this.velocities);
}

// void main() {
//   Motor motor = motorFromSerie(Serie.B16A1);
//   Transmission transmission = transmissionFromType(Type.Standard);
//   Vehicle hondaCivic = Vehicle(motor, transmission);
// }

// Future<void> inyector() {

// }

// class Vehicle {
//   Motor motor;
//   Transmission transmission;

//   Vehicle(this.motor, this.transmission);
// }

// class Standard extends Transmission {
//   Standard() : super(5);
// }

// class Automatic extends Transmission {
//   Automatic() : super(6);
// }

// abstract class Motor {
//   final int maxRPM;

//   Motor(this.maxRPM);
// }

// class MotorB16A1 extends Motor {
//   MotorB16A1() : super(7600);
// }

// class MotorB16A2 extends Motor {
//   MotorB16A2() : super(8400);
}

// void main() {
//   if (serie == 'B16A1') {
//     VehicleWithMotorB16A2 hondaCivicB16A1 = VehicleWithMotorB16A2();
//   } else {
//     VehicleWithMotorB16A1 hondaCivicB16A2 = VehicleWithMotorB16A1();
//   }
// }

// class VehicleWithMotorB16A1 {
//   MotorB16A1 motor = MotorB16A1();
// }

// class VehicleWithMotorB16A2 {
//   MotorB16A2 motor = MotorB16A2();
// }

// abstract class Motor {
//   final int maxRPM;

//   Motor(this.maxRPM);
// }

// class MotorB16A1 {
//   final int maxRPM = 7600;
// }

// class MotorB16A2 {
//   final int maxRPM = 8400;
// }
