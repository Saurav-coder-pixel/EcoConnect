
import 'package:flutter/material.dart';
import 'package:ecoconnect/api/auth_service.dart';
import 'package:ecoconnect/screens/home/main_home_screen.dart';
import 'package:ecoconnect/screens/learn/learn_screen.dart';
import 'package:ecoconnect/screens/tasks/tasks_screen.dart';
import 'package:ecoconnect/screens/games/games_screen.dart';
import 'package:ecoconnect/screens/chat/chat_screen.dart';
import 'package:ecoconnect/screens/profile/profile_screen.dart';
import 'package:ecoconnect/screens/rewards/rewards_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  int _currentIndex = 0;

  final List<Widget> _children = [
    MainHomeScreen(),
    LearnScreen(),
    TasksScreen(),
    GamesScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoConnect'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RewardsScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.amber, size: 28,),
                  const SizedBox(width: 4),
                  Text('1250', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('Logout', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.green),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle, color: Colors.green),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games, color: Colors.green),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.green),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
