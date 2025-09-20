
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:ecoconnect/screens/auth/authenticate.dart';
import 'package:ecoconnect/screens/home/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    // return either Authenticate or Home widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
