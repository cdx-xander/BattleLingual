import 'package:battlelingual/features/characters/models/character_model.dart';

class CharacterData {
  CharacterData._();

  static const List<CharacterModel> initialCharacters = [
    CharacterModel(
      name: 'Levi',
      imagePath: 'assets/images/characters/levi.png',
      health: 200,
      maxHealth: 500,
      defense: 200,
      maxDefense: 500,
      attack: 200,
      maxAttack: 500,
    ),
    CharacterModel(
      name: 'Freya',
      imagePath: 'assets/images/characters/freya.png',
      health: 250,
      maxHealth: 500,
      defense: 320,
      maxDefense: 500,
      attack: 140,
      maxAttack: 500,
    ),
    CharacterModel(
      name: 'Lyra',
      imagePath: 'assets/images/characters/lyra.png',
      health: 150,
      maxHealth: 500,
      defense: 120,
      maxDefense: 500,
      attack: 340,
      maxAttack: 500,
    ),
    CharacterModel(
      name: 'Borin',
      imagePath: 'assets/images/characters/borin.png',
      health: 300,
      maxHealth: 500,
      defense: 220,
      maxDefense: 500,
      attack: 280,
      maxAttack: 500,
    ),
  ];
}
