import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/cricket_score.dart';
import 'package:flutter/material.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  final List<CricketScore> _cricketScoreList = [];

  void _extractData(QuerySnapshot<Map<String, dynamic>>? snapshot) {
    _cricketScoreList.clear();
    for (DocumentSnapshot doc in snapshot?.docs ?? []) {
      _cricketScoreList.add(
        CricketScore.fromJson(doc.id, doc.data() as Map<String, dynamic>),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        foregroundColor: Colors.white,
        title: const Text('Live Score'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cricket').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
                child: Text(
              snapshot.error.toString(),
            ));
          }

          if (snapshot.hasData) {
            _extractData(snapshot.data);
            return ListView.builder(
              itemCount: _cricketScoreList.length,
              itemBuilder: (context, index) {
                CricketScore cricketScore = _cricketScoreList[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 8,
                    backgroundColor:
                        _indicatorColor(cricketScore.isMatchRunning),
                  ),
                  title: Text(cricketScore.matchId),
                  subtitle: Text(
                      'Team One: ${cricketScore.teamOne}\nTeam Two: ${cricketScore.teamTwo}'),
                  trailing: Text(
                      '${cricketScore.teamOneScore}/${cricketScore.teamTwoScore}'),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Color _indicatorColor(bool isMatchRunning) {
    return isMatchRunning ? Colors.green : Colors.grey;
  }
}
