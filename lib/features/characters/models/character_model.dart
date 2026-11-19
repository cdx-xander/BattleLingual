class CharacterModel {
  final int? id;
  final String name;
  final String imagePath;
  final int health;
  final int maxHealth;
  final int defense;
  final int maxDefense;
  final int attack;
  final int maxAttack;
  final bool isUnlocked;

  const CharacterModel({
    this.id,
    required this.name,
    required this.imagePath,
    required this.health,
    required this.maxHealth,
    required this.defense,
    required this.maxDefense,
    required this.attack,
    required this.maxAttack,
    this.isUnlocked = true,
  });

  // Convert a Dart object into a SQLite Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image_path': imagePath,
      'health': health,
      'max_health': maxHealth,
      'defense': defense,
      'max_defense': maxDefense,
      'attack': attack,
      'max_attack': maxAttack,
      'is_unlocked': isUnlocked ? 1 : 0, // SQLite uses 1 and 0 for booleans
    };
  }

  // Convert a SQLite row Map back into a Dart object
  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      imagePath: map['image_path'] as String,
      health: map['health'] as int,
      maxHealth: map['max_health'] as int,
      defense: map['defense'] as int,
      maxDefense: map['max_defense'] as int,
      attack: map['attack'] as int,
      maxAttack: map['max_attack'] as int,
      isUnlocked: (map['is_unlocked'] as int) == 1,
    );
  }
}
