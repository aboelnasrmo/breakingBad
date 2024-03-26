// ignore_for_file: public_member_api_docs, sort_constructors_first
class Qoute {
  String? qoute;
  Qoute({
    this.qoute,
  });

  factory Qoute.fromJson(Map<String, dynamic> json) {
    return Qoute(
      qoute: json['quote'],
    );
  }
}
