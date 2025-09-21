
import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> _board = List.filled(9, '');
  String _currentPlayer = 'X';
  String _winner = '';

  void _play(int index) {
    if (_board[index] == '' && _winner == '') {
      setState(() {
        _board[index] = _currentPlayer;
        _checkWinner();
        if (_winner == '') {
          _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  void _checkWinner() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (_board[i] != '' &&
          _board[i] == _board[i + 1] &&
          _board[i] == _board[i + 2]) {
        _winner = _board[i];
        return;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_board[i] != '' &&
          _board[i] == _board[i + 3] &&
          _board[i] == _board[i + 6]) {
        _winner = _board[i];
        return;
      }
    }

    // Check diagonals
    if (_board[0] != '' && _board[0] == _board[4] && _board[0] == _board[8]) {
      _winner = _board[0];
      return;
    }
    if (_board[2] != '' && _board[2] == _board[4] && _board[2] == _board[6]) {
      _winner = _board[2];
      return;
    }

    // Check for a draw
    if (!_board.contains('')) {
      _winner = 'Draw';
    }
  }

  void _resetGame() {
    setState(() {
      _board = List.filled(9, '');
      _currentPlayer = 'X';
      _winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://i.imgur.com/8i21sYc.png',
                height: 150,
              ),
              const SizedBox(height: 20),
              Text(
                _winner == ''
                    ? 'Current Player: $_currentPlayer'
                    : _winner == 'Draw'
                        ? 'It\'s a Draw!'
                        : 'Winner: $_winner',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _play(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          _board[index],
                          style: const TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetGame,
                child: const Text('Reset Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
