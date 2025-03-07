import 'package:flutter/material.dart';
import '../models/player.dart';

class PlayerProvider extends ChangeNotifier {
  final List<Player> _players = [];

  List<Player> get players => _players;

  void addPlayer(String name) {
    if (_players.length < 8) {
      _players.add(Player(name));
      notifyListeners();
    }
  }

  void updateScore(int index, int score) {
    _players[index].score += score;
    notifyListeners();
  }

  void resetGame() {
    for (var player in _players) {
      player.score = 0;
      player.bet = 0;
      player.wins = 0;
    }
    notifyListeners();
  }
}
