import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estacionamento do Sr. João',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estacionamento do Sr. João'),
      ),
      body: Column(
        children: [
          // Lista de Vagas de Estacionamento (use um ListView.builder)
          // Botões "Entrada/Saída" e "Histórico"
        ],
      ),
    );
  }
}

class EntryExitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Entrada/Saída'),
      ),
      body: Column(
        children: [
          // Campo de Placa (use um TextField)
          // Botões "Entrada" e "Saída"
          // Informação da Vaga
        ],
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Entradas/Saídas'),
      ),
      body: Column(
        children: [
          // Lista de Histórico (use um ListView.builder)
          // Opção de Filtro (por data, etc.)
          // Botão "Limpar Histórico"
        ],
      ),
    );
  }
}
