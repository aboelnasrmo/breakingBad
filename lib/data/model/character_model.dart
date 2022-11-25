class Character {
  int charId;
  String name;
  String birthday;
  List<String> occupation;
  String img;
  String status;
  String nickname;
  List<int> appearance;
  String portrayed;
  String category;
  List<dynamic> betterCallSaulAppearance;

  Character({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        charId: json['char_id'],
        name: json['name'],
        birthday: json['birthday'],
        occupation: json['occupation'].cast<String>(),
        img: json['img'],
        status: json['status'],
        nickname: json['nickname'],
        appearance: json['appearance'].cast<int>(),
        portrayed: json['portrayed'],
        category: json['category'],
        betterCallSaulAppearance: json['better_call_saul_appearance']);
  }
}
