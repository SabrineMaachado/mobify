import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobify/pages/history_screen.dart';

void main() {
  testWidgets('Teste de renderização da tela HistoryScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HistoryScreen()));
    
    // Verifique se o título 'Histórico' é renderizado
    expect(find.text('Histórico'), findsOneWidget);
    
    // Verifique se os itens de histórico são renderizados
    expect(find.byType(ListTile), findsWidgets);
  });

  test('Teste de cálculo do total diário', () {
    final data = [
      {
        'placa': 'ABC-1234',
        'entrada': '30/10/2023 10:00',
        'saida': '30/10/2023 11:30',
        'total': 15.00,
      },
      {
        'placa': 'XYZ-5678',
        'entrada': '30/10/2023 12:00',
        'saida': '30/10/2023 13:45',
        'total': 121.50,
      },
      {
        'placa': 'EWR-3344',
        'entrada': '30/10/2023 10:00',
        'saida': '30/10/2023 11:30',
        'total': 152.00,
      },
      {
        'placa': 'MNB-2684',
        'entrada': '30/10/2023 12:00',
        'saida': '30/10/2023 13:45',
        'total': 12.50,
      },
    ];

    const historyScreen = HistoryScreen();
    final totalDiario = historyScreen.calculateDailyTotal(data);

    expect(totalDiario, 301.0); // O total diário deve ser 301.0
  });
}
