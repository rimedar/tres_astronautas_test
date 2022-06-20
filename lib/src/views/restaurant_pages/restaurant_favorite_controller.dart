import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tres_astronautas_test/src/models/gif_model.dart';

class RestaurantFavoriteController {
  String endPoint = 'https://api.giphy.com';
  String version = 'v1';
  String apiKey = 'cEYU7cjy0rVog0AMkCnnf4a4zCcERGM0';

//  gifs/search?api_key=cEYU7cjy0rVog0AMkCnnf4a4zCcERGM0&q=restaurant&limit=3&offset=0&rating=g&lang=es
  GifModel? gif;

  List<Map<String, dynamic>> optionList = [
    {
      'option': 'All',
      'search': 'foods',
      'pressed': false,
    },
    {
      'option': 'Happy Hours',
      'search': 'restaurant',
      'pressed': false,
    },
    {
      'option': 'Drink',
      'search': 'drink',
      'pressed': false,
    },
    {
      'option': 'Beer',
      'search': 'beers',
      'pressed': false,
    }
  ];

  Future giftSearch({String? search, BuildContext? context}) async {
    Map<String, String> queryParams = {
      'api_key': apiKey,
      'q': search ?? 'restaurant',
      'limit': '5',
      'offset': '0',
      'rating': 'g',
      'lang': 'es',
    };

    // Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // };
    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = '$endPoint/$version/gifs/search?' + queryString;
    try {
      final response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var gif = GifModel.fromJson(data);
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
            backgroundColor: Colors.white24,
            content: Text(
              'Recibiendo datos',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )));
        return gif;
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
            backgroundColor: Colors.white24,
            content: Text(
              'Error :${response.body} ',
              style: const TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.bold),
            )));
      }
    } on SocketException {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          backgroundColor: Colors.white24,
          content: Text(
            'No hay conexion a internet',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          )));
    }
  }
}
