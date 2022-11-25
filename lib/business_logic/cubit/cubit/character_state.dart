part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterIsloaded extends CharacterState {
  //this what will i get if it's loaded succesfully
  final List<Character> characters;
  CharacterIsloaded(this.characters);
}
