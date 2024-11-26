class CricketScore {
  final String matchId;
  final String teamOne;
  final String teamTwo;
  final int teamOneScore;
  final int teamTwoScore;
  final bool isMatchRunning;
  final String winnerTeam;

  CricketScore({
    required this.matchId,
    required this.teamOne,
    required this.teamTwo,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.isMatchRunning,
    required this.winnerTeam,
  });

  factory CricketScore.fromJson(String id, Map<String, dynamic> Json) {
    return CricketScore(
      matchId: id,
      teamOne: Json['teamOne'],
      teamTwo: Json['teamTwo'],
      teamOneScore: Json['teamOneScore'],
      teamTwoScore: Json['teamTwoScore'],
      isMatchRunning: Json['isMatchRunning'],
      winnerTeam: Json['winnerTeam'],
    );
  }
}
