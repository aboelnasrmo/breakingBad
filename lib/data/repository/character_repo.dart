import 'package:approutertrial/data/model/character_model.dart';
import 'package:approutertrial/data/web_services/web_services.dart';

class CharactersRepository {
  final WebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
