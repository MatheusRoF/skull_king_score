import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/player_provider.dart';
import 'screens/player_screen.dart';

void main() {
  runApp(const SkullKingApp());
}

class SkullKingApp extends StatelessWidget {
  const SkullKingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlayerProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PlayerScreen(),
      ),
    );
  }
}
