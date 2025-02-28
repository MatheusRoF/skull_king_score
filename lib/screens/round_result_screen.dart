import 'package:flutter/material.dart';
import 'score_screen.dart';

class RoundResultScreen extends StatefulWidget {
  final List<String> players;
  final List<int> bets; // Lista de apostas feitas pelos jogadores

  RoundResultScreen({required this.players, required this.bets});

  @override
  _RoundResultScreenState createState() => _RoundResultScreenState();
}

class _RoundResultScreenState extends State<RoundResultScreen> {
  late List<int> victories; // Contador de vitórias por jogador
  late List<bool> bonus;
  late List<bool> mermaidCaptures;
  late List<bool> pirateCaptures;
  late List<int> scores;

  @override
  void initState() {
    super.initState();
    int playerCount = widget.players.length;
    victories = List.filled(playerCount, 0); // Inicializa com 0 vitórias
    bonus = List.filled(playerCount, false);
    mermaidCaptures = List.filled(playerCount, false);
    pirateCaptures = List.filled(playerCount, false);
    scores = List.filled(playerCount, 0); // Inicializa as pontuações
  }

  void _calculateScores() {
    for (int i = 0; i < widget.players.length; i++) {
      int points = 0;

      // Cada vitória vale 20 pontos
      points += victories[i] * 20;

      // Se a aposta foi de 0 e ele acertou, ganha 10 pontos por rodada
      if (widget.bets[i] == 0 && victories[i] == 0) {
        points += 10;
      }

      // Aplicando bônus e capturas
      if (bonus[i]) points += 10;
      if (mermaidCaptures[i]) points += 30;
      if (pirateCaptures[i]) points += 50;

      scores[i] += points; // Atualiza a pontuação final
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreScreen(players: widget.players, scores: scores),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultados da Rodada")),
      body: ListView.builder(
        itemCount: widget.players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.players[index]),
            subtitle: Column(
              children: [
                Text("Aposta: ${widget.bets[index]} rodadas"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Vitórias:"),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (victories[index] > 0) victories[index]--;
                        });
                      },
                    ),
                    Text(victories[index].toString(), style: TextStyle(fontSize: 18)),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          victories[index]++;
                        });
                      },
                    ),
                  ],
                ),
                CheckboxListTile(
                  title: Text("Bônus Especial"),
                  value: bonus[index],
                  onChanged: (val) => setState(() => bonus[index] = val!),
                ),
                CheckboxListTile(
                  title: Text("Capturou Sereia"),
                  value: mermaidCaptures[index],
                  onChanged: (val) => setState(() => mermaidCaptures[index] = val!),
                ),
                CheckboxListTile(
                  title: Text("Capturou Pirata"),
                  value: pirateCaptures[index],
                  onChanged: (val) => setState(() => pirateCaptures[index] = val!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculateScores,
        child: Icon(Icons.check),
      ),
    );
  }
}