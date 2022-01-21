import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/repository/repository.dart';

class AllCharactersController extends GetxController {
  final page = 1.obs;
  final isLoading = false.obs;
  final hasException = false.obs;

  final _repository = Repository();

  final characters = <Character>[].obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fetchCharacters(page.value);
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        page.value++;
        fetchCharacters(page.value);
      }
    });
    super.onInit();
  }

  void fetchCharacters(int page) async {
    isLoading.value = true;
    final result = await _repository.getResult(page);

    if (result.hasException) {
      hasException.value = true;
      isLoading.value = false;
      print(result.exception);
    }

    if (result.isNotLoading) {
      isLoading.value = false;
    }
    if (hasException.isFalse && isLoading.isFalse) {
      final List<dynamic> listResult = result.data!['characters']['results'];
      for (var element in listResult) {
        characters.add(Character.fromJson(element));
      }
    }
  }
}
