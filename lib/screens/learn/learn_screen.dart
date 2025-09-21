
import 'package:flutter/material.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<int>(
                segments: const <ButtonSegment<int>>[
                  ButtonSegment<int>(value: 0, label: Text('Environment')),
                  ButtonSegment<int>(value: 1, label: Text('Academic')),
                ],
                selected: <int>{_selectedIndex},
                onSelectionChanged: (Set<int> newSelection) {
                  setState(() {
                    _selectedIndex = newSelection.first;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _selectedIndex == 0
                  ? _buildEnvironmentSection()
                  : _buildAcademicSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnvironmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Learn & Grow 🌱',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text('Expand your environmental knowledge'),
        const SizedBox(height: 20),
        const Text('Your Learning Progress'),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: 0.25,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
        ),
        const SizedBox(height: 5),
        const Align(
          alignment: Alignment.centerRight,
          child: Text('1/4 completed'),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'Search lessons...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildFilterButton('All', true),
              const SizedBox(width: 8),
              _buildFilterButton('Climate Science', false),
              const SizedBox(width: 8),
              _buildFilterButton('Water Resources', false),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'All Lessons(4)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              _buildLessonCard(
                'Climate Change Basics',
                'Understanding global warming and its impact on India',
                '15 min',
                '+50 pts',
                true,
              ),
              _buildLessonCard(
                'Water Conservation',
                'Learn how to conserve water in your daily life',
                '20 min',
                '+75 pts',
                false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAcademicSection() {
    return const Center(
      child: Text(
        'Academic Section - Coming Soon!',
        style: TextStyle(fontSize: 18),
      ),
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

  Widget _buildLessonCard(
      String title, String subtitle, String duration, String points, bool isCompleted) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                isCompleted
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.play_circle_fill, color: Colors.green),
              ],
            ),
            Text(subtitle),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.timer, size: 16),
                const SizedBox(width: 5),
                Text(duration),
                const SizedBox(width: 20),
                Text(points,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
