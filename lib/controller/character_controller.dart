import 'package:get/get.dart';
import 'package:rick_and_morty/controller/all_characters_controller.dart';
import 'package:rick_and_morty/model/character.dart';

class CharacterController extends GetxController {
  late int _index;
  late Character character;
  final _allCharactersController = Get.find<AllCharactersController>();

  @override
  void onInit() {
    _index = Get.arguments['index'];
    character = _allCharactersController.characters[_index];
    super.onInit();
  }
}
