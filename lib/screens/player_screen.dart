import 'package:flutter/material.dart';
import 'bet_screen.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final List<String> players = [];
  final TextEditingController _controller = TextEditingController();

  void _addPlayer() {
    if (_controller.text.isNotEmpty && players.length < 8) {
      setState(() {
        players.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _startGame() {
    if (players.length >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BetScreen(players: players, onBetsConfirmed: (bets) {}),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Jogadores")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Nome do jogador"),
            ),
          ),
          ElevatedButton(onPressed: _addPlayer, child: Text("Adicionar")),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) => ListTile(title: Text(players[index])),
            ),
          ),
          ElevatedButton(
            onPressed: _startGame,
            child: Text("Iniciar Jogo"),
          ),
        ],
      ),
    );
  }
}