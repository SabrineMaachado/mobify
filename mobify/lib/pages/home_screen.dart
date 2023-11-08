import 'package:flutter/material.dart';
import 'package:mobify/pages/entry_exit_screen.dart';
import 'package:mobify/pages/history_screen.dart';
import '../models/parking_spot_model.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
  late final List<ParkingSpot> parkingSpot;

class _HomeScreenState extends State<HomeScreen> {
  late List<bool> disponibilidadeVagas;

  List<ParkingSpot> parkingSpot = List.generate(
      6, (index) => ParkingSpot(index + 1, available: false, number: false));

  @override
  void initState() {
    super.initState();
    disponibilidadeVagas = List.generate(6, (index) => true);
  }

  void _toggleAvailability(int index) {
    setState(() {
      disponibilidadeVagas[index] = !disponibilidadeVagas[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estacionamento'),
        backgroundColor:  const Color.fromARGB(0, 42, 42, 42),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HistoryScreen()));
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF434343), 
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Vagas',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                bool isAvailable = disponibilidadeVagas[index];

                return _buildParkingSpotCard(index, isAvailable);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParkingSpotCard(int index, bool isAvailable) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const EntryExitScreen()));
        _toggleAvailability(index);
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isAvailable ? Colors.green : Colors.red,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isAvailable ? Icons.check : Icons.close,
              color: isAvailable ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vaga ${parkingSpot[index].number}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  isAvailable ? 'Disponível' : 'Não disponível',
                  style: const TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
