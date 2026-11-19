import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';
import '../models/character_model.dart';

class CharacterController extends GetxController {
  final selectedIndex = 0.obs;
  final characters = <CharacterModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    isLoading.value = true;
    final data = await StorageService.instance.getAllCharacters();
    characters.assignAll(data);
    isLoading.value = false;
  }

  CharacterModel? get currentCharacter =>
      characters.isEmpty ? null : characters[selectedIndex.value];

  void previousCharacter() {
    if (characters.isEmpty) return;
    selectedIndex.value =
        (selectedIndex.value - 1 + characters.length) % characters.length;
  }

  void nextCharacter() {
    if (characters.isEmpty) return;
    selectedIndex.value = (selectedIndex.value + 1) % characters.length;
  }
}
