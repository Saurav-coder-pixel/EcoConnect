
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecoconnect/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:ecoconnect/api/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'EcoConnect',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
