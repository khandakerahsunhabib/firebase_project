import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade300,
          foregroundColor: Colors.white,
          title: const Text('Live Score'),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Badge(
                  backgroundColor: _indicatorColor(true),
                ),
                title: Text('Match id'),
                subtitle: Text('Team One: Bangladesh\n Team Two: England'),
              );
            }));
  }

  Color _indicatorColor(bool isMatchRunning) {
    return isMatchRunning ? Colors.green : Colors.grey;
  }
}
