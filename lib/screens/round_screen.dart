import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/player_provider.dart';
import 'score_screen.dart';

class RoundScreen extends StatelessWidget {
  const RoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var playerProvider = Provider.of<PlayerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Rodada 1")),
      body: ListView.builder(
        itemCount: playerProvider.players.length,
        itemBuilder: (context, index) {
          var player = playerProvider.players[index];
          return ListTile(
            title: Text(player.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Aposta: ${player.bet}"),
                Text("Venceu: ${player.wins}"),
                Text("Pontuação: ${player.score}"),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                playerProvider.updateScore(index, 10); // Simula um ganho de pontos
              },
              child: const Text("+10"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ScoreScreen()));
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
