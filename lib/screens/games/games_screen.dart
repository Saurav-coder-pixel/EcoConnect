import 'package:ecoconnect/screens/games/chess_screen.dart';
import 'package:ecoconnect/screens/games/tic_tac_toe_screen.dart';
import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> games = [
      {
        'title': 'Tic Tac Toe',
        'image': 'https://i.imgur.com/8i21sYc.png',
        'route': const TicTacToeScreen(),
        'comingSoon': false,
      },
      {
        'title': 'Building Stacking Game',
        'image': 'https://static.vecteezy.com/system/resources/previews/000/349/513/original/vector-tower-building-illustration.jpg',
        'route': null,
        'comingSoon': true,
      },
      {
        'title': 'Chess',
        'image': 'https://images.chesscomfiles.com/uploads/v1/images_users/tiny_mce/PeterDoggers/phpYd3S5B.png',
        'route': const ChessScreen(),
        'comingSoon': false,
      },
      {
        'title': 'Ludo',
        'image': 'https://img.freepik.com/premium-vector/ludo-board-game-new-design-vector-illustration_541903-1229.jpg',
        'route': null,
        'comingSoon': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini-Games'),
        flexibleSpace: Container(
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
        ),
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
        child: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.75,
          ),
          itemCount: games.length,
          itemBuilder: (context, index) {
            final game = games[index];
            return GameCard(
              title: game['title'],
              image: game['image'],
              route: game['route'],
              comingSoon: game['comingSoon'],
            );
          },
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  final String image;
  final Widget? route;
  final bool comingSoon;

  const GameCard({
    super.key,
    required this.title,
    required this.image,
    this.route,
    this.comingSoon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: GestureDetector(
        onTap: () {
          if (comingSoon) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title - Coming Soon!')),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route!),
            );
          }
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                image,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.broken_image, size: 40, color: Colors.grey,));
                },
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            if (comingSoon)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Coming Soon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
