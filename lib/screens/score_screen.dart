import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final List<String> players; // Lista de jogadores
  final List<int> scores; // Lista de pontuações de cada jogador

  // Construtor da tela de pontuação
  ScoreScreen({required this.players, required this.scores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pontuações")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Placar Atual",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Espaçamento entre elementos
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          (index + 1).toString(), // Número do jogador
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(players[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      trailing: Text(
                        scores[index].toString(), // Exibe a pontuação do jogador
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela anterior
              },
              child: Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}