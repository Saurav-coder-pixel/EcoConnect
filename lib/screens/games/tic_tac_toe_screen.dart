import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  String currentPlayer = 'X';
  bool gameOver = false;
  String winner = '';

  void _resetGame() {
    setState(() {
      board = ['', '', '', '', '', '', '', '', ''];
      currentPlayer = 'X';
      gameOver = false;
      winner = '';
    });
  }

  void _makeMove(int index) {
    if (board[index] == '' && !gameOver) {
      setState(() {
        board[index] = currentPlayer;
        _checkWinner();
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
    }
  }

  void _checkWinner() {
    const winningPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6]             // Diagonals
    ];

    for (var pattern in winningPatterns) {
      final first = board[pattern[0]];
      final second = board[pattern[1]];
      final third = board[pattern[2]];

      if (first != '' && first == second && first == third) {
        setState(() {
          gameOver = true;
          winner = first;
        });
        return;
      }
    }

    if (!board.contains('')) {
      setState(() {
        gameOver = true;
        winner = 'Draw';
      });
    }
  }

  Widget _buildGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _makeMove(index),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                board[index],
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildGrid(),
            if (gameOver)
              Text(
                winner == 'Draw' ? 'It\'s a Draw!' : 'Winner: $winner',
                style: const TextStyle(fontSize: 24),
              ),
            if (gameOver)
              ElevatedButton(
                onPressed: _resetGame,
                child: const Text('Reset Game'),
              ),
          ],
        ),
      ),
    );
  }
}
