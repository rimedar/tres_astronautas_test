import 'dart:convert';

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

  Future<GifModel> giftSearch({String? search}) async {
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

    final response = await http.get(Uri.parse(requestUrl));
    var data = json.decode(response.body);
    var gif = GifModel.fromJson(data);
    return gif;
  }
}
