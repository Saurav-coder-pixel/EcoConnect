
import 'package:flutter/material.dart';
import 'package:ecoconnect/api/auth_service.dart';
import 'package:ecoconnect/screens/home/main_home_screen.dart';
import 'package:ecoconnect/screens/learn/learn_screen.dart';
import 'package:ecoconnect/screens/tasks/tasks_screen.dart';
import 'package:ecoconnect/screens/games/games_screen.dart';
import 'package:ecoconnect/screens/chat/chat_screen.dart';
import 'package:ecoconnect/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
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
            icon: new Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.school, color: Colors.green),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.check_circle, color: Colors.green),
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
