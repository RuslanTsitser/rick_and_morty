import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/controller/all_characters_controller.dart';
import 'package:rick_and_morty/view/character_page.dart';

class AllCharactersPage extends StatelessWidget {
  AllCharactersPage({Key? key}) : super(key: key);
  final controller = Get.put(AllCharactersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: Obx(
        () => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.characters.length,
          itemBuilder: (context, index) {
            if (controller.isLoading.isTrue) {
              return const Center(child: CircularProgressIndicator());
            }
            return GestureDetector(
              onTap: () {
                Get.toNamed('/character_page', arguments: {'index': index});
              },
              child: Container(
                decoration: BoxDecoration(),
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Ink.image(
                          image:
                              NetworkImage(controller.characters[index].image)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.characters[index].name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          controller.characters[index].gender == 'Male'
                              ? const Icon(Icons.male)
                              : const Icon(Icons.female),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // leading: Ink.image(
              //     image: NetworkImage(controller.characters[index].image)),
            );
          },
        ),
      ),
    );
  }
}
