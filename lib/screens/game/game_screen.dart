import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Welcome to the Game Screen!'),
      ),
    );
  }
}
