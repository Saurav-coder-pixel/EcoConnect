
import 'package:flutter/material.dart';

class ChessScreen extends StatelessWidget {
  const ChessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Chess Game - Coming Soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
