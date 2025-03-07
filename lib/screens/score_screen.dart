import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/player_provider.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var playerProvider = Provider.of<PlayerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Placar Final")),
      body: ListView.builder(
        itemCount: playerProvider.players.length,
        itemBuilder: (context, index) {
          var player = playerProvider.players[index];
          return ListTile(
            title: Text(player.name),
            trailing: Text("Pontos: ${player.score}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          playerProvider.resetGame();
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
