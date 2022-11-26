class Qoute {
  String? qoute;

  Qoute.fromJson(Map<String, dynamic> json) {
    qoute = json['quote'];
  }
}
