import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
        backgroundColor:  const Color.fromARGB(0, 42, 42, 42),
      ),
      backgroundColor: const Color(0xFF434343), 
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView.builder(
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  final historicoItem = historyData[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Placa: ${historicoItem['placa']}',
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Entrada: ${historicoItem['entrada']}  Saída: ${historicoItem['saida']}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          'Total Pago: R\$ ${historicoItem['total']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(color: Colors.white),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        constraints: const BoxConstraints.expand(
          height: 100.0,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 46, 45, 45), 
        ),
        padding: const EdgeInsets.all(20),
        child: Text(
          'Total Diário: R\$ ${calculateDailyTotal(historyData)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  double calculateDailyTotal(List<Map<String, dynamic>> data) {
    double total = 0;
    for (var historicoItem in data) {
      total += historicoItem['total'];
    }
    return total;
  }
}

List<Map<String, dynamic>> historyData = [
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
