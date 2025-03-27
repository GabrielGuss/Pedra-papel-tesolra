import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: PedraPapelTesoura()),
  );
}

class PedraPapelTesoura extends StatefulWidget {
  @override
  _PedraPapelTesouraState createState() => _PedraPapelTesouraState();
}

class _PedraPapelTesouraState extends State<PedraPapelTesoura> {
  final List<String> opcoes = ["pedra", "papel", "tesoura"];
  String escolhaUsuario = "pedra"; // Definir um valor inicial para evitar erro
  String escolhaMaquina = "pedra";
  int vitorias = 0;
  int derrotas = 0;
  int empates = 0;

  void jogar(String escolha) {
    setState(() {
      escolhaUsuario = escolha;
      escolhaMaquina = opcoes[Random().nextInt(3)];

      if (escolhaUsuario == escolhaMaquina) {
        empates++;
      } else if ((escolhaUsuario == "pedra" && escolhaMaquina == "tesoura") ||
          (escolhaUsuario == "papel" && escolhaMaquina == "pedra") ||
          (escolhaUsuario == "tesoura" && escolhaMaquina == "papel")) {
        vitorias++;
      } else {
        derrotas++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pedra, Papel, Tesoura"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Disputa",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/$escolhaUsuario.png",
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 80, color: Colors.red);
                },
              ),
              SizedBox(width: 20),
              Text("vs", style: TextStyle(fontSize: 22)),
              SizedBox(width: 20),
              Image.asset(
                "assets/$escolhaMaquina.png",
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 80, color: Colors.red);
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Placar",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              placarBox("Você", vitorias),
              placarBox("Empate", empates),
              placarBox("Máquina", derrotas),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Opções",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: opcoes.map((opcao) => escolhaBotao(opcao)).toList(),
          ),
        ],
      ),
    );
  }

  Widget placarBox(String titulo, int valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            titulo,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "$valor",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget escolhaBotao(String opcao) {
    return GestureDetector(
      onTap: () => jogar(opcao),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Image.asset(
          "assets/$opcao.png",
          width: 80,
          height: 80,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error, size: 80, color: Colors.red);
          },
        ),
      ),
    );
  }
}
