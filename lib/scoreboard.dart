import 'package:flutter/material.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        foregroundColor: Colors.white,
        title: const Text('Live Score'),
      ),
    );
  }
}
