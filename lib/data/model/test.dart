// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Test {
  String? test;
  String? myName;
  Test({
    this.test,
    this.myName,
  });

  Test copyWith({
    String? test,
    String? myName,
  }) {
    return Test(
      test: test ?? this.test,
      myName: myName ?? this.myName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'test': test,
      'myName': myName,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      test: map['test'] != null ? map['test'] as String : null,
      myName: map['myName'] != null ? map['myName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) =>
      Test.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Test(test: $test, myName: $myName)';

  @override
  bool operator ==(covariant Test other) {
    if (identical(this, other)) return true;

    return other.test == test && other.myName == myName;
  }

  @override
  int get hashCode => test.hashCode ^ myName.hashCode;
}
