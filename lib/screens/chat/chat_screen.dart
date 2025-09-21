
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                  ButtonSegment<int>(value: 0, label: Text('Community')),
                  ButtonSegment<int>(value: 1, label: Text('Friend')),
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
                  ? _buildCommunitySection()
                  : _buildFriendSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunitySection() {
    return const Center(
      child: Text(
        'Community Section - Coming Soon!',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildFriendSection() {
    return const Center(
      child: Text(
        'Friend Section - Coming Soon!',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
