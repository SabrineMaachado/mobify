import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobify/pages/history_screen.dart';
import 'package:mobify/pages/home_screen.dart';

void main() {
  testWidgets('Teste de renderização da tela inicial da HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    
    // Verifique se o título 'Estacionamento' é renderizado
    expect(find.text('Estacionamento'), findsOneWidget);
    
    // Verifique se há 6 vagas renderizadas
    expect(find.byType(ListTile), findsNWidgets(6));
  });

  testWidgets('Teste de navegação para a tela de histórico', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Toque no ícone de histórico na barra de ação
    await tester.tap(find.byIcon(Icons.history));
    await tester.pumpAndSettle();

    // Verifique se a tela de histórico foi navegada
    expect(find.byType(HistoryScreen), findsOneWidget);
  });

  testWidgets('Teste de alternância de disponibilidade de vaga', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Toque em uma vaga para alternar a disponibilidade
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    // Verifique se a disponibilidade da vaga foi alternada
    expect(find.text('Disponível'), findsOneWidget);

    // Toque na mesma vaga novamente para alternar de volta
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    // Verifique se a disponibilidade da vaga foi alternada de volta
    expect(find.text('Não disponível'), findsOneWidget);
  });
}
