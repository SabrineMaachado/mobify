import 'package:flutter/material.dart';

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
