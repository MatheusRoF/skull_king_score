
import 'package:flutter/material.dart';
import 'screens/player_screen.dart';

void main() {
  runApp(SkullKingApp());
}

class SkullKingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skull King Score',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PlayerScreen(),
    );
  }
}