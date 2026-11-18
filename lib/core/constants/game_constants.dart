
class GameConstants {
  GameConstants._();

  // ==========================================
  // GAME WORLD
  // ==========================================

  static const double tileSize = 64.0;

  static const int defaultMapRows = 20;
  static const int defaultMapColumns = 30;


  // ==========================================
  // PLAYER DEFAULTS
  // ==========================================

  static const double defaultPlayerSpeed = 150.0;

  static const int defaultPlayerHealth = 100;
  static const int defaultPlayerDefense = 10;
  static const int defaultPlayerAttack = 20;


  // ==========================================
  // COMBAT
  // ==========================================

  static const double defaultAttackRange = 100.0;

  static const double defaultAttackCooldown = 0.5;

  static const double defaultProjectileSpeed = 300.0;


  // ==========================================
  // ENEMIES
  // ==========================================

  static const int defaultEnemyHealth = 50;

  static const double defaultEnemySpeed = 80.0;

  static const double defaultEnemyDetectionRange = 200.0;


  // ==========================================
  // GAMEPLAY
  // ==========================================

  static const int defaultStartingCoins = 100;

  static const int defaultStartingLevel = 1;

  static const int defaultStartingExperience = 0;
}
