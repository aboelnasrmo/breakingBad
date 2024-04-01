part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterIsloaded extends CharacterState {
  final List<Character> characters;
  CharacterIsloaded(this.characters);
}

class QoutesLoaded extends CharacterState {
  final List<Qoute> qoutes;
  QoutesLoaded(this.qoutes);
}

class DeathLoaded extends CharacterState {
  final List<Death> death;
  DeathLoaded(this.death);
}
