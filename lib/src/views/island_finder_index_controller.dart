import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/src/views/island_finder/island_finder_all_page.dart';
import 'package:tres_astronautas_test/src/views/island_finder/island_finder_page.dart';

class IslandFinderIndexController {
  List<Map<String, dynamic>> optionList = [
    {
      'option': 'Up Dowm Left Rigth',
      'page': const IslandFinderPage(),
      'icon': Icons.gamepad_outlined,
    },
    {
      'option': 'All Directions',
      'page': const IslandFinderAllPage(),
      'icon': Icons.circle_outlined,
    },
  ];
}
