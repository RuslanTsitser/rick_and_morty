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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(character.image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Species - ' + character.species,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Status - ' + character.status,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Origin ' + character.origin!.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'Location ' + character.location.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 30,
              child: Text('Episodes:'),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: character.episode.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        // color: Colors.red[50],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Episode ' + character.episode[index].episode,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            character.episode[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          // const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // Column(
        //   children: <Widget>[
        //     SizedBox(
        //       child: Ink.image(image: NetworkImage(character.image)),
        //       height: 300,
        //     ),
        //     Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        //       width: double.infinity,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             character.name,
        //             style: Theme.of(context).textTheme.headline6,
        //           ),
        //           Text(
        //             character.species,
        //             style: Theme.of(context).textTheme.subtitle1,
        //           ),
        //           Text(
        //             'Status ' + character.status,
        //             style: Theme.of(context).textTheme.subtitle1,
        //           ),
        //           Text(
        //             'Origin ' + (character.origin?.name ?? 'No home'),
        //             style: Theme.of(context).textTheme.subtitle1,
        //           ),
        //           Text(
        //             'Location ' + (character.location.name ?? 'No home'),
        //             style: Theme.of(context).textTheme.subtitle1,
        //           ),
        //           Text(
        //             'Episodes:',
        //             style: Theme.of(context).textTheme.subtitle1,
        //           ),
        //           const SizedBox(height: 10),

        //         ],
        //       ),
        // ),
        // ],
      ),
      // ),
    );
  }
}
