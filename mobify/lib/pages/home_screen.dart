import 'package:flutter/material.dart';

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
