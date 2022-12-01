import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_editor/screens/welcome_screen.dart';

class CompletelyUnnecessaryRegistrationScreen extends StatefulWidget {
  const CompletelyUnnecessaryRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<CompletelyUnnecessaryRegistrationScreen> createState() =>
      _CompletelyUnnecessaryRegistrationScreenState();
}

class _CompletelyUnnecessaryRegistrationScreenState
    extends State<CompletelyUnnecessaryRegistrationScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Enter your e-mail.',
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.5,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            TextField(
              controller: usernameController,
              autocorrect: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Enter your username.',
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.5,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.5,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final user = await _auth.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (user != null) {
                    print('success');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WelcomeScreen();
                    }));
                  }
                } catch (e) {
                  print('error');
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}