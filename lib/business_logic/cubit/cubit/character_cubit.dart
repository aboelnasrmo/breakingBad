import 'package:approutertrial/data/model/character_model.dart';
import 'package:approutertrial/data/repository/character_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
  late List<Character> characters;
  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharacterIsloaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
