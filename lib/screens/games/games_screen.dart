import 'package:flutter/material.dart';
import 'package:ecoconnect/screens/games/tic_tac_toe_screen.dart';
import 'package:ecoconnect/screens/games/chess_screen.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini-Games'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8BC34A), // Light Green
              Color(0xFF388E3C), // Dark Green
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TicTacToeScreen()),
                  );
                },
                child: const Text('Tic Tac Toe'),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Building Stacking Game - Coming Soon!')),
                  );
                },
                child: const Text('Building Stacking Game'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChessScreen()),
                  );
                },
                child: const Text('Chess'),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ludo - Coming Soon!')),
                  );
                },
                child: const Text('Ludo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
