
import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Leaderboard 🏆',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('See how you rank among eco-warriors'),
            SizedBox(height: 20),
            _buildYourPositionCard(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton('Individual', true),
                SizedBox(width: 10),
                _buildToggleButton('Schools', false),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Top Eco-Warriors',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildLeaderboardItem('R', 'Rahul', '2200', '1'),
                  _buildLeaderboardItem('P', 'Priya', '2450', '2'),
                  _buildLeaderboardItem('A', 'Arjun', '1250', '3'),
                  _buildLeaderboardItem('S', 'Sneha Patel', '1180', '4'),
                  _buildLeaderboardItem('V', 'Vikram Singh', '1050', '5'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYourPositionCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildPositionStat('Your Position', '#3'),
            _buildPositionStat('Points', '1250'),
            _buildPositionStat('Level', '5'),
            _buildPositionStat('This Week', '+150'),
          ],
        ),
      ),
    );
  }

  Widget _buildPositionStat(String title, String value) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(title),
      ],
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      child: Text(text),
    );
  }

  Widget _buildLeaderboardItem(String initial, String name, String points, String rank) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(initial),
        ),
        title: Text(name),
        subtitle: Text('Level 5'), // Assuming a static level for now
        trailing: Text('$rank - $points'),
      ),
    );
  }
}
