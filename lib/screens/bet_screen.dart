import 'package:flutter/material.dart';
import 'round_result_screen.dart';

class BetScreen extends StatefulWidget {
  final List<String> players;
  final Function(List<int>) onBetsConfirmed;

  BetScreen({required this.players, required this.onBetsConfirmed});

  @override
  _BetScreenState createState() => _BetScreenState();
}

class _BetScreenState extends State<BetScreen> {
  late List<int> bets;

  @override
  void initState() {
    super.initState();
    bets = List.filled(widget.players.length, 0);
  }

  void _confirmBets() {
    widget.onBetsConfirmed(bets);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoundResultScreen(players: widget.players, bets: bets),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apostas - Rodada 1")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.players[index]),
                  trailing: DropdownButton<int>(
                    value: bets[index],
                    onChanged: (value) {
                      setState(() {
                        bets[index] = value ?? 0;
                      });
                    },
                    items: List.generate(11, (i) => i)
                        .map((e) => DropdownMenuItem(value: e, child: Text(e.toString())))
                        .toList(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _confirmBets,
              child: Text("Confirmar Apostas"),
            ),
          ),
        ],
      ),
    );
  }
}