// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/src/models/gif_model.dart';
import 'package:tres_astronautas_test/src/utils/responsive.dart';
import 'package:tres_astronautas_test/src/views/restaurant_pages/restaurant_favorite_controller.dart';

class RestaurantFavoritePage extends StatefulWidget {
  const RestaurantFavoritePage({Key? key}) : super(key: key);

  @override
  State<RestaurantFavoritePage> createState() => _RestaurantFavoritePageState();
}

class _RestaurantFavoritePageState extends State<RestaurantFavoritePage>
    with SingleTickerProviderStateMixin {
  RestaurantFavoriteController resFavoriteController =
      RestaurantFavoriteController();
  String? selectedPAge;
  String? toSearchPage;

  @override
  void initState() {
    super.initState();
    resFavoriteController.optionList[0]['pressed'] = true;
    selectedPAge = resFavoriteController.optionList[0]['option'];
    toSearchPage = resFavoriteController.optionList[0]['search'];
    // resFavoriteController.giftSearch();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: responsive.wp(98),
          height: responsive.hp(98),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image(
                    width: responsive.wp(25),
                    image: const AssetImage('assets/images/nasa.gif'),
                  ),
                  SizedBox(
                    width: responsive.wp(42),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: IconButton(
                        color: Colors.black45,
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none)),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: IconButton(
                        color: Colors.black45,
                        onPressed: () {},
                        icon: const Icon(Icons.settings_outlined)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: responsive.hp(3)),
                    child: Text(
                      'Favorites',
                      style: TextStyle(
                          fontSize: responsive.dp(4),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                ],
              ),
              Row(
                children: List.generate(resFavoriteController.optionList.length,
                    (index) {
                  bool status =
                      resFavoriteController.optionList[index]['pressed'];
                  return SizedBox(
                    height: responsive.hp(8),
                    child: GestureDetector(
                      onTap: () {
                        print('presed');
                        for (var element in resFavoriteController.optionList) {
                          element['pressed'] = false;
                        }
                        resFavoriteController.optionList[index]['pressed'] =
                            true;

                        toSearchPage =
                            resFavoriteController.optionList[index]['search'];

                        selectedPAge =
                            resFavoriteController.optionList[index]['option'];
                        setState(() {});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        color: status ? Colors.orange[300] : Colors.white,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsive.wp(4.5),
                                vertical: responsive.hp(1.5)),
                            child: Text(
                              resFavoriteController.optionList[index]['option'],
                              style: TextStyle(
                                  color: status ? Colors.white : Colors.black,
                                  fontSize: responsive.dp(2),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedPAge!,
                    style: TextStyle(
                        fontSize: responsive.dp(3),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: IconButton(
                        color: Colors.black45,
                        onPressed: () {},
                        icon: const Icon(Icons.delete_rounded)),
                  )
                ],
              ),
              FutureBuilder(
                  future: resFavoriteController.giftSearch(
                      search: toSearchPage, context: context),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ));
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: responsive.wp(2),
                                    vertical: responsive.hp(1.5),
                                  ),
                                  child: Container(
                                    width: responsive.wp(90),
                                    height: responsive.hp(25),
                                    child: Stack(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        Positioned(
                                          top: responsive.hp(2.5),
                                          left: responsive.wp(2),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              snapshot.data!.data[index].images
                                                  .original.url,
                                              width: responsive.wp(40),
                                              height: responsive.wp(30),
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, exception,
                                                      stackTrack) =>
                                                  Column(
                                                children: [
                                                  SizedBox(
                                                    width: responsive.wp(40),
                                                    child: Text(
                                                      'No se pudo cargar la imagen',
                                                      style: TextStyle(
                                                          fontSize: responsive
                                                              .dp(1.6),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.error,
                                                  ),
                                                ],
                                              ),
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        Colors.greenAccent,
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                );
                                              },
                                              cacheHeight: 100,
                                              cacheWidth: 100,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: responsive.wp(45),
                                          top: responsive.hp(2.5),
                                          child: SizedBox(
                                            width: responsive.wp(45),
                                            child: Text(
                                                snapshot
                                                    .data!.data[index].title,
                                                style: TextStyle(
                                                    fontSize: responsive.dp(2),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: responsive.hp(3),
                                          left: responsive.wp(15),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(35),
                                            ),
                                            child: IconButton(
                                                color: Colors.black45,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite_rounded,
                                                  color: Colors.orange,
                                                  size: responsive.dp(4),
                                                )),
                                          ),
                                        ),
                                        Positioned(
                                          right: 10,
                                          top: 0,
                                          child: Text('...',
                                              style: TextStyle(
                                                  fontSize: responsive.dp(2),
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300]!,
                                            offset: const Offset(-0.1, 0.1),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                          ),
                                          BoxShadow(
                                            color: Colors.grey[300]!,
                                            offset: const Offset(0.1, -0.1),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                          )
                                        ]),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

void function() {
  print('Ejecutado');
}
