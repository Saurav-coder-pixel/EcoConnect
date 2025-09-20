import 'package:flutter/material.dart';

class ChessScreen extends StatelessWidget {
  const ChessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess'),
      ),
      body: const Center(
        child: Text('Chess - Coming Soon!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
