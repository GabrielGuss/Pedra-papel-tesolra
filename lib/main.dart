import 'package:flutter/material.dart';

void main() {
  runApp(PedraPapelTesouraApp());
}

class PedraPapelTesouraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PedraPapelTesouraScreen(),
    );
  }
}

class PedraPapelTesouraScreen extends StatefulWidget {
  @override
  _PedraPapelTesouraScreenState createState() =>
      _PedraPapelTesouraScreenState();
}

class _PedraPapelTesouraScreenState extends State<PedraPapelTesouraScreen> {
  int userScore = 0;
  int machineScore = 0;
  int ties = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pedra, Papel, Tesoura")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Disputa",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/pedra.png', width: 80),
              Text("vs", style: TextStyle(fontSize: 20)),
              Image.asset('assets/tesoura.png', width: 80),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Placar",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildScoreColumn("Você", userScore),
              _buildScoreColumn("Empate", ties),
              _buildScoreColumn("Máquina", machineScore),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Opções",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGestureImage('assets/pedra.png'),
              _buildGestureImage('assets/papel.png'),
              _buildGestureImage('assets/tesoura.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreColumn(String label, int score) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(score.toString(), style: TextStyle(fontSize: 24)),
        ),
      ],
    );
  }

  Widget _buildGestureImage(String imagePath) {
    return GestureDetector(
      onTap: () {
        // Lógica do jogo aqui
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset(imagePath, width: 80),
      ),
    );
  }
}
