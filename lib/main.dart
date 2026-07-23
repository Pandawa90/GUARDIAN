import 'package:flutter/material.dart';

void main() {
  runApp(const GuardianTest());
}

class GuardianTest extends StatelessWidget {
  const GuardianTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            "GUARDIAN TEST OK",
            style: TextStyle(
              color: Colors.green,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
