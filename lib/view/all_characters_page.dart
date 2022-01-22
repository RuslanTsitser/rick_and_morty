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
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 3.0)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                controller.characters[index].image),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            controller.characters[index].name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                        controller.characters[index].gender == 'Male'
                            ? const Icon(Icons.male, size: 30)
                            : const Icon(Icons.female, size: 30),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    // Text(
                    //   article.title,
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16.0,
                    //   ),
                    // ),
                    // const SizedBox(height: 8.0),
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
