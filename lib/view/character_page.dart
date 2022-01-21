import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/controller/character_controller.dart';

class CharacterPage extends StatelessWidget {
  CharacterPage({Key? key}) : super(key: key);

  final controller = Get.put(CharacterController());

  @override
  Widget build(BuildContext context) {
    final character = controller.character;
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Ink.image(image: NetworkImage(character.image)),
              height: 300,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    character.species,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Status ' + character.status,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Origin ' + (character.origin?.name ?? 'No home'),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Location ' + (character.location.name ?? 'No home'),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Episodes:',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: character.episode.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(character.episode[index].episode),
                            Text(character.episode[index].name),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
