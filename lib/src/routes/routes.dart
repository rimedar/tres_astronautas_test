import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/src/home.dart';
import 'package:tres_astronautas_test/src/views/island_finder_index_page.dart';
import 'package:tres_astronautas_test/src/views/restaurant_page.dart';
import 'package:tres_astronautas_test/src/views/restaurant_pages/restaurant_under_construction_page.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => const Home(),
  '/island_finder': (context) => const IslandFinderIndexPage(),
  '/restaurant': (context) => const RestaurantPage(),
  '/restaurant_home': (context) => const RestaurantPage(),
  '/restaurant_calendar': (context) =>
      const RestaurantUnderConstructionPage('Calendario'),
  '/restaurant_search': (context) =>
      const RestaurantUnderConstructionPage('Buscar'),
  '/restaurant_favorite': (context) => const RestaurantPage(),
};
