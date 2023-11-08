import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobify/pages/entry_exit_screen.dart';
import 'package:mobify/pages/home_screen.dart';

void main() {
  testWidgets('Teste de renderização da tela EntryExitScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: EntryExitScreen()));
    
    // Verifique se o título 'Registrar Entrada/Saída' é renderizado
    expect(find.text('Registrar Entrada/Saída'), findsOneWidget);
    
    // Verifique se os campos de texto e o botão 'Confirmar' são renderizados
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.text('Confirmar'), findsOneWidget);
  });

  testWidgets('Teste de navegação para a tela HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: EntryExitScreen()));

    // Toque no botão 'Confirmar' para simular a navegação para HomeScreen
    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle(); // Espere a transição terminar

    // Verifique se a tela HomeScreen foi navegada
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
