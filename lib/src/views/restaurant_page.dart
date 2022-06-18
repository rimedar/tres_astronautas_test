import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/src/utils/responsive.dart';
import 'package:tres_astronautas_test/src/views/restaurant_page_controller.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  RestaurantPageController restaurantPageController =
      RestaurantPageController();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Restaurant',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
          ),
        ),
        body: restaurantPageController
            .optionList[restaurantPageController.selectedIndex]['route'],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: List.generate(
            restaurantPageController.optionList.length,
            (index) => BottomNavigationBarItem(
              activeIcon: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: responsive.wp(8)),
                    child: Icon(
                      restaurantPageController.optionList[index]['icon'],
                      size: responsive.dp(4),
                    ),
                  ),
                  Positioned(
                      left: responsive.wp(8),
                      child: Text(
                        restaurantPageController.optionList[index]['option'],
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: responsive.dp(1.2),
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              icon: Padding(
                padding: EdgeInsets.only(right: responsive.wp(8)),
                child: Icon(
                  restaurantPageController.optionList[index]['icon'],
                  size: responsive.dp(3),
                ),
              ),
              label: '',
            ),
          ),
          currentIndex: restaurantPageController.selectedIndex,
          onTap: (value) =>
              setState(() => restaurantPageController.onItemTapped(value)),
          elevation: 3.0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ));
  }
}
