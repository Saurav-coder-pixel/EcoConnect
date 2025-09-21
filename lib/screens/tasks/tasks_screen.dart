
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eco Challenges 🎯',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Take action for the environment'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoCard('Completed', '1'),
                _buildInfoCard('Points Earned', '100'),
                _buildInfoCard('Available', '4'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton('All', true),
                _buildFilterButton('Active', false),
                _buildFilterButton('Completed', false),
                _buildFilterButton('Easy', false),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '🔥 Featured Challenge',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildFeaturedChallengeCard(),
            SizedBox(height: 20),
            Text(
              'All Bonus Challenges(5)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildChallengeCard(
                    'Plant a Tree',
                    'Plant a sapling in your school or neighborhood and share a photo',
                    '+100 pts',
                    'Easy',
                    true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(title),
      ],
    );
  }

  Widget _buildFilterButton(String text, bool isSelected) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      child: Text(text),
    );
  }

  Widget _buildFeaturedChallengeCard() {
    return Card(
      elevation: 2,
      color: Colors.amber[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weekly Eco Challenge', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Complete any 3 challenges this week to earn a special "Weekly Warrior" badge!'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('+200 Bonus Points', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                Text('5 days left'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChallengeCard(
      String title, String subtitle, String points, String difficulty, bool isCompleted) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                isCompleted
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : SizedBox.shrink(),
              ],
            ),
            Text(subtitle),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(points, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                Text(difficulty, style: TextStyle(color: Colors.orange)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
