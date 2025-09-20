import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Tasks'),
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
        child: const Center(
          child: Text('Tasks Screen'),
        ),
      ),
    );
  }
}
