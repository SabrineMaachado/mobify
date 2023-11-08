import 'package:flutter/material.dart';
import 'package:mobify/pages/home_screen.dart'; // Importe a tela que você deseja exibir após a tela de abertura

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black54, //
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31), // Fundo cinza escuro
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logotipo centralizado (substitua 'logo.svg' pelo caminho correto)
            Image.asset(
              'lib/assets/logo.jpg',
              width: 400, // Largura do logotipo
              height: 400, // Altura do logotipo
            ),
            SizedBox(height: 50), // Espaço entre o logotipo e o botão
            ElevatedButton(
              onPressed: () {
                // Ao clicar no botão, navegue para a tela desejada (por exemplo, HomeScreen)
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(0, 53, 52, 52), // Fundo transparente
                onPrimary: Color.fromARGB(255, 0, 0, 0), // Cor de fundo preta
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(200, 60), // Largura e altura personalizadas
              ),
              child: const Text(
                'Entrar',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Texto em negrito
                  fontSize: 18, // Tamanho da fonte
                  color: Colors.white, // Cor do texto branca
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
