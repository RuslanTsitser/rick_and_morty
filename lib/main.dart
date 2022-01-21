import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rick_and_morty/view/all_characters_page.dart';

import 'view/character_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => AllCharactersPage(),
        ),
        GetPage(
          name: '/character_page',
          page: () => CharacterPage(),
        ),
      ],
      home: AllCharactersPage(),
    );
  }
}
