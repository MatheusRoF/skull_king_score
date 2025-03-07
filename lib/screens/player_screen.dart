import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/player_provider.dart';
import 'round_screen.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  PlayerScreenState createState() => PlayerScreenState();
}

class PlayerScreenState extends State<PlayerScreen> {  // Alterar de _PlayerScreenState para PlayerScreenState
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var playerProvider = Provider.of<PlayerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar Jogadores")),
      body: Column(
        children: [
          TextField(controller: _controller, decoration: const InputDecoration(labelText: "Nome do Jogador")),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                playerProvider.addPlayer(_controller.text);
                _controller.clear();
              }
            },
            child: const Text("Adicionar"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: playerProvider.players.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(playerProvider.players[index].name),
              ),
            ),
          ),
          if (playerProvider.players.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RoundScreen()));
              },
              child: const Text("Iniciar Jogo"),
            ),
        ],
      ),
    );
  }
}

