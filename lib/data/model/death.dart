class Death {
  Death({
    required this.deathId,
    required this.death,
    required this.cause,
    required this.responsible,
    required this.lastWords,
    required this.season,
    required this.episode,
    required this.numberOfDeaths,
  });

  int deathId;
  String death;
  String cause;
  String responsible;
  String lastWords;
  int season;
  int episode;
  int numberOfDeaths;

  factory Death.fromJson(Map<String, dynamic> json) => Death(
        deathId: json["death_id"],
        death: json["death"],
        cause: json["cause"],
        responsible: json["responsible"],
        lastWords: json["last_words"],
        season: json["season"],
        episode: json["episode"],
        numberOfDeaths: json["number_of_deaths"],
      );
}
