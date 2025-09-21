
import 'package:flutter/material.dart';
import 'package:ecoconnect/screens/leaderboard/leaderboard_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Arjun! 👋',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Ready to save the planet today?'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Progress to Level 6'),
                  Text('250 points to go'),
                ],
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: 0.0,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              SizedBox(height: 30),
              Text(
                'Your Impact',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildImpactCard(context, 'Challenges Completed', '12', Icons.track_changes),
                  _buildImpactCard(context, 'Lessons Finished', '8', Icons.book),
                  _buildImpactCard(context, 'School Rank', '#3', Icons.leaderboard),
                  _buildImpactCard(context, 'Friends', '24', Icons.people),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Badges',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: Text('See All')),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBadge('Tree Hugger', Icons.eco),
                  _buildBadge('Quiz Master', Icons.lightbulb),
                  _buildBadge('Eco Warrior', Icons.shield),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImpactCard(BuildContext context, String title, String value, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'School Rank') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
          );
        }
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.green),
              SizedBox(height: 10),
              Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String name, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green.withAlpha(51),
          child: Icon(icon, size: 30, color: Colors.green),
        ),
        SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}
