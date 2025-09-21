
import 'package:flutter/material.dart';
import 'package:ecoconnect/api/auth_service.dart';

class SignupScreen extends StatefulWidget {
  final Function toggleView;
  const SignupScreen({super.key, required this.toggleView});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up for EcoConnect'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('Sign In', style: TextStyle(color: Colors.white)),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      dynamic result = await _auth.createUserWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'Please supply a valid email');
                      }
                    } catch (e) {
                      setState(() => error = 'An error occurred. Please try again.');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
