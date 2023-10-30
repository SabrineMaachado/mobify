// lógica para navegar entre as telas e gerenciar o estado global, se necessário.

import 'package:flutter/material.dart';
import 'package:mobify/pages/entry_exit_screen.dart';
import 'package:mobify/pages/history_screen.dart';
import 'package:mobify/pages/home_screen.dart';

void main() => runApp(ParkingApp());

class ParkingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/entry_exit': (context) => EntryExitScreen(),
        '/history': (context) => HistoryScreen(),
      },
    );
  }
}
