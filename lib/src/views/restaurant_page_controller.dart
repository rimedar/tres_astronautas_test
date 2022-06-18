import 'package:flutter/material.dart';

import 'restaurant_pages/restaurant_favorite_page.dart';
import 'restaurant_pages/restaurant_home_page.dart';
import 'restaurant_pages/restaurant_under_construction_page.dart';

class RestaurantPageController {
  List<Map<String, dynamic>> optionList = [
    {
      'option': 'Inicio',
      'route': const RestaurantHomePage(),
      'icon': Icons.home_rounded
    },
    {
      'option': 'Calendario',
      'route': const RestaurantUnderConstructionPage('Calendario'),
      'icon': Icons.calendar_today_rounded
    },
    {
      'option': 'Buscar',
      'route': const RestaurantUnderConstructionPage('Buscar'),
      'icon': Icons.search_rounded
    },
    {
      'option': 'Favoritos',
      'route': const RestaurantFavoritePage(),
      'icon': Icons.favorite_rounded
    }
  ];
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
  }
}
